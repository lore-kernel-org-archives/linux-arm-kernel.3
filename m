Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB273C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjPiDRtkBxxHS008iG49oRhf0qpCD3AfI/FuawlGAtQ=; b=MlUMva/dgnkWHwgOXVZFme1oCF
	qrbLJPw6TAC/KJsiiqySmInkuDB+kfkrd92MKi/5DuT81Syz/93o/FfAHIjizuDL5f2OMw76OgzhA
	PSL4xi1Q9Mz/0lNSyodHHT5TS6LBnuyHfgOpW3TPCSHDg9Q8UVcrJNRabrn0yn16GCXyyrCLXJsoR
	V5ghghHEOj6fQ1dbpJlZG9lDx25nmJZfa3KmbvkrOc1AU+ISqoT5HoRCWwoRxkqQjZ8BjrKsxa6Vw
	Mk4b4t/1d/z7AjUeIa05kAq5xoV3FUR2uyYWEH9FaBkmVadE9rF7bs9TGKniZgDs3dpNZN2vntLnQ
	ecD3UJag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepLq-00000000tjt-2WTJ;
	Wed, 01 Jul 2026 07:27:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepLn-00000000tiw-0Bf4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:27:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615ljLo145191
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 07:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UjPiDRtkBxxHS008iG49oRhf0qpCD3AfI/FuawlGAtQ=; b=a6N2XewAv+horXnK
	nKkWBvQxpygYro9ayToWkB+R+7sHu+pSIFsh6CKOXOc+upk4XoQcHznfXwVh+2m8
	9UfxKuwo+PCvR3+N/+QowoQW8W6a8KHRalmB02z2+C4CNqnSR6JLYmHyb12wwsyV
	QDYySU/vWiSn8ZLRyKlpjinT8fpduIsElGhR8p5zyqf9QXo/4gVsb1zu38hcl8Fs
	QKDPDtCs8oknupQhU9oAy2ZVjmczQ72QkxGsLUn92OP2eTGzSFDpl17p0bPf6bmw
	1VplRXkA/PWjCHP4Al3Jc0ByNqnU1h0Ii7YW7pAzra/x5BSkc2HjbRU2tn4Yjs0B
	qK/V5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktaudc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 07:27:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6ed4fe99so70724585a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 00:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782890833; x=1783495633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjPiDRtkBxxHS008iG49oRhf0qpCD3AfI/FuawlGAtQ=;
        b=L3LUzMcB52LPtvGTuVNjNMEmBTY8KQUwnxmLQyjcGT6zAdr9BmtwcC6k758rrIw6bk
         eBEAIXiNUa4komHy+dDitM1WsDQ8ksdoeouCo8f1SC1ewShu+in0HwyY1CYH4aUYl612
         sgdi8CHAbIfcGXknLsCzXORJtvapAybmALOEp5475K2EP/+uXkSm7EKexYWb1VL4K/o9
         +D2eQesY7u1SU/PQVVwFC0lvP+EsJFtRyFiPIKp4GMSzpA+xgScljkeVAGrtu2SRRcP9
         4FWcgX33dILHPmaZr6beRjUSNCiXDj/U9523GezCvv58nH5DcaEpVz2qgVR2vHMRIq+n
         g5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782890833; x=1783495633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjPiDRtkBxxHS008iG49oRhf0qpCD3AfI/FuawlGAtQ=;
        b=Ck+Uymhlk6/+VkJV98yf+cXXGO1N4En5VcGwQyxv7VSMIQNALmIHLNEtX0id6uxur/
         6jEdE3pUQ9qY4zRbPd6SlzpyaECAUqgEtQxRfvub1GE2fE9BX+xaE31FE4HjAvhese6z
         e02FLi/G+IcGmRinhhYrsQ9jgIH611f50RfdEQwployfE5vv905+GQEPIkYCg5hxGSLg
         ySWaYlrtoP7fsZPf8sWPhK+ad/O7lXie5UmzbVsNn9StL9krdTeiaolavQv7F0kbGJty
         Mzq3qbHkCSd4mMtKknpQcYBYMC1sILHugwQMTq4jAYWgW39G5mij+XcyaDlTGTretYRl
         0Y/A==
X-Forwarded-Encrypted: i=1; AFNElJ8rBuPZO2XKwNwpekCNuDZn7VIlsAI56xwYfU0CV3EFiLqvaujaJFbJjyoXoweTVgSPyKgRM7qcPWQTlwdAsf+C@lists.infradead.org
X-Gm-Message-State: AOJu0YyIJJvqBIg5nEur+7PkYkQMbKH51RipqKJVwtJx7KBAoQ3NuH/4
	U4glw2iOw0/uZTBGCTSzvcv/wwWFdeWfz/bZJkB6ojmXbOaOBEuoaI+5nbOD72+MwRYFPr2wQjc
	5ltrwJhkiIZ6cA3xGOfZyRZBlDHVBKahGEbiO5UmsL/NFwcGfZycy0+x/Y4Z0eEvH3KOA5V6USQ
	1zZg==
X-Gm-Gg: AfdE7clCNPeQouXja/chlIJIj5ZN4V7NdGn0+UNQcVHWxUa546kHxfWDTHHw3KlBj98
	eRGtAK+yeYDyfxQnzkK4QJNb0ifnsC+oK12F2xekgltqww4BiUovbWe17YXIfZVKQiht5ly1Cmq
	+CGsjURVVURBav02gC89+kuAUL0buuF34r7Biuhqm51Bc2pXDZ6TvF0qyTw1iMMrnjU8bkMjwK/
	vijsJK6drRE71B787fNk7JNjm76tso/VI7lcobU1sOvyrvaywAdIzv6olQ1sM9vrf4szNsK96fS
	OHjW52fT1AGP5LurzV2u00w0Bc8DpTn5qM35WrStivVavKTTWzMea4as0GTDtuwaPz7ZPYic7wr
	GacP4vnldTWneEKNYCzNygscU1eAfdxUeC0qa4RU=
X-Received: by 2002:a05:620a:1a19:b0:926:e8e6:3c34 with SMTP id af79cd13be357-92e78217161mr66560485a.21.1782890833324;
        Wed, 01 Jul 2026 00:27:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1a19:b0:926:e8e6:3c34 with SMTP id af79cd13be357-92e78217161mr66556385a.21.1782890832668;
        Wed, 01 Jul 2026 00:27:12 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4718:fd49:e3d7:676a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47566c0deacsm15559815f8f.26.2026.07.01.00.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:27:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Viacheslav Bocharov <v@baodeep.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore meson non-sleeping
Date: Wed,  1 Jul 2026 09:27:09 +0200
Message-ID: <178289081780.4972.9992474509894050572.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260625115718.1678991-1-v@baodeep.com>
References: <20260625115718.1678991-1-v@baodeep.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NSBTYWx0ZWRfX+GtDTsB0fibO
 h2QEwSNo8YFa+HOM0QIg/xIvGiD0sHjaYZtISNApYC6Bp5SDXYHMTFrKSyAJWaTuwHyCkgB4C4h
 YBAVKxpVVDKrpmBpSXIylNmVI4cEyaI=
X-Proofpoint-GUID: ulZIj1OmH37crv2FkVoIBzqh9oCUde7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NSBTYWx0ZWRfX1DjTXRIVI738
 t8pSXYQdOcBIugy/qyi8vXHnP6K7k+e0o74c5OHWdeS+HCrONSc7xhEq1IW8cuCr4TvUrEHmBSX
 kbfl+2u+CWXz4OSnLkQAmEnIMvuj3LOG7oCfAL0ojtp4Hjut44/VFMxpmYFpYGNHBGderdGgXA9
 7qEYNQK0WypE6/6mLISU/WP3BtQVLdf9Aktn8U+i+UaNAwtj538vnr3Y6T+IWStSId+kGW3VzUv
 IqAbj+PH/ftH723aIooptTbmOQ71ImdLiN5Zutvp/E7DJ468IvAu51ehbgl3RLEbYLUROcdN1Pc
 onRFyeV+iuGe3MO28SkrnKJIFPGCEGYIyXjleJFdz2CjrrslvdFrH75wBKFy6YooB1jpygJb1En
 BtyHhiQT9QHHUzVIQYWV7Uzpdml6/zFQgHKOuUwp7BTKAilzhAZbxhcJ/v+1LkzXlbLkMuSpzRR
 ZvWr0Csxzy2dtwe3DJA==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44c151 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1LRHIn5sqR3nmJZzQNMA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ulZIj1OmH37crv2FkVoIBzqh9oCUde7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_002715_197972_0AC51696 
X-CRM114-Status: GOOD (  13.50  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Thu, 25 Jun 2026 14:57:16 +0300, Viacheslav Bocharov wrote:
> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
> the underlying chip's can_sleep, but under that lock it calls config and
> direction ops that reach sleeping pinctrl paths. On a controller with
> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
> runs from atomic context:
> 
>   BUG: sleeping function called from invalid context
>     ... pinctrl_gpio_set_config <- gpiochip_generic_config
>     <- gpio_shared_proxy_set_config (voting spinlock held)
>     <- ... <- mmc_pwrseq_simple_probe
> 
> [...]

Applied, thanks!

[2/2] pinctrl: meson: restore non-sleeping GPIO access
      https://git.kernel.org/brgl/c/9777530157e7b82fd994327ff878c4245dadc931

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

