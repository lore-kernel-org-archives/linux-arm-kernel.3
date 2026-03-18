Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B77A103E198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXY6wf+7y63C26nOd5CZ2U3ebxiVslPLzrbxrFszJYY=; b=iC7yDe8wCQ00m9o+UE+zEZURR+
	uikmWyfmVo2oEra3PbOhiQNE3iR+4KSLPB/S6W7oihiHiVfJrYbMEkKyJeBTPA1vWPB3PJ13TNdDA
	GW34+uHkl3TUahNe4ZS3DidxRB/omtWzGH8YkYtqeWjBhilkMy6gsquV52qPA4XOM/8RfAX0K5nT3
	z6NnSlybh7QZiHCT2NnGlWHpQ4EHUoTqjYt4Uhr/hZGoFTuTtzGbSGU1bYQqDTl8Ya8k/bZX28qOj
	cEexV9LXLjGMb7jsZkd8zhTN7XcJUjWTplvx62wOEZgeYNZEKBBf82tGx+2BfzbvkNz7BICx2Hewo
	XxVEq8ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t08-00000008jgf-20qo;
	Wed, 18 Mar 2026 15:40:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t00-00000008jdj-29Sf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:39:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFXBOI1768860
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iXY6wf+7y63C26nOd5CZ2U3ebxiVslPLzrbxrFszJYY=; b=LRWNwILl3nqlah/m
	28mzsgN8aYGvXAZI/X+/n7iVRTLkK7uE+FXL2VeLE5nC5/s7FrZXH+kX0KrlKI2f
	q8ZNcnXd8VogylJ2AkTbyrvXGl6LmPVTWBh6k9BGooD94+PxG5ML9bwgT5LN/M8z
	+3MogOSYUR/SvoHObh4CXl2gNTfla40fUkVmeQhcybYnvlYb2qJwYlLG28m82Va1
	sF1P5f59JDfOBoPS4tWaZdwKYUJEvqM1479yj+i1QwZz4+1PX0ml/WDtx4wwQdcL
	biELnU972j5PIujX7n5GaS1+VCnbEbGpnNqtbCHKXlbzxhtfmx+Eoj3tApWhEFpQ
	zbXl0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqetx46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:39:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50937c5b742so233370681cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848395; x=1774453195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXY6wf+7y63C26nOd5CZ2U3ebxiVslPLzrbxrFszJYY=;
        b=EbZfJT7+BFMnxFswUCy/RDlUeoAw0kgblsnGoVHzwJwE0Bolk6hp1W0IauMmmXUv9q
         H5QlWgJC9BHItraHvqpnYJkT0dMiM1lxCom2OjnyHA4Xq+B8wlCBi0VyAcqr/c5teiVc
         vInm1XGweVnzo+PY7vM/giyjnoEqeA+DiPKmXMQ+YJvBynNEHbmBzJvjjijuHYur+aO9
         1r2aLv5nGqH2FDxK+YHTB9oA1TJFvhlrPo6DWMl6PFvMshRtDWWcBJlY5ytu3yB5J387
         2KjNAbtPNPxDTz38GPC/DbRIK1rNx4ubVNBtfQYoQTneQRwTo2VRt67gcLHKAIMZm+8H
         bDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848395; x=1774453195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iXY6wf+7y63C26nOd5CZ2U3ebxiVslPLzrbxrFszJYY=;
        b=OO5nSb4pXKYldiDidYeoLYjYQUTep4ap+gzW1aazkM2OlasurAoq+qFbwVzZ+Rwq/7
         lN3pdS269K/anrVVge/BrNbnwsPHqtVPV/UaBQff/588lKD/FnfwUor0mNXmd8OW6rxs
         rxoInTxsfIcaxlOGWlPOMX8sSnY29KM4W2h0xKzuTtTlgwhJNUQJrucP2ipSUhfe89JU
         Ae+IfQOM9ywhC4sr6Dj425NIMQZgpVOav622+IT5cf2MRQjmVEHE6jXUbQ5pPX22DthT
         mhJaj3/vpRJWL/DVfSP61mwfOVyJtf9AFH6vW4rXwAZ2nVMcThZ0ln67Y577edSu4I+t
         1pzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVadS7VzJA1RurrK2eHEaXaKUlW6h0RGIB9Tnc1keMrfJu1hZnGt/hxEyoZx9YrJDuSiwgzksSPotW+OQ9+kdUY@lists.infradead.org
X-Gm-Message-State: AOJu0YySjE6Y9EUrxHevjeZ4A1KL94+q3vQMS+OZ+sCUerSSKDtmq8oN
	d5Eish/DZxs/40BqoRKvCQxdha3dfksN4H+qapon0egH2mXft/+RdH0V8SZkRgKVd9sYBQJ0+QN
	22KUjIQLFr6jn2ZND2+1nuMJjk4JWPu9LzERqC8dz22cNHBf8Di967K8OJWIZvKlF141dddkj/h
	upLWDr24fKYQ==
X-Gm-Gg: ATEYQzxmmojDYvr4vmdgXgXw97j4xYaGkH12hOTYOXs5lLMEQVhIbjxl7oLL/wk2Wxs
	Yi9b0RPGI72sIgOcCHp1LPccP4YKH5MK5G5oWgRzvlYFAp30RuFICydFKu794jYCPvUa/cDFUEy
	WzUu6s9+QaKhp50k8H1R3wioSEPo+E7RimoFvhSgk66HYkItn19JmBuPBr1PQDHKF7ZzU3ISkUz
	wmvnqVSHJSDPCpgihINoKzDYTiUdGWPPk//LbcCyWdwGWqxi6NuIuHQjqlqj11GjDksqSocee02
	P2zU4pe4FDqibIZkB7n1DYNi/W+44019PlxXxNNL30J8nWiHhO+DHerupjcLtWzDK4Y71d4RgbG
	pXzHzgKc5J0XcKRl3egqT7KNCTJg=
X-Received: by 2002:a05:622a:344:b0:509:44c3:5ff9 with SMTP id d75a77b69052e-50b1485f448mr46464621cf.37.1773848394619;
        Wed, 18 Mar 2026 08:39:54 -0700 (PDT)
X-Received: by 2002:a05:622a:344:b0:509:44c3:5ff9 with SMTP id d75a77b69052e-50b1485f448mr46464071cf.37.1773848394077;
        Wed, 18 Mar 2026 08:39:54 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:39:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH v2 1/1] clk: imx: pll14xx: Use unsigned format specifier
Date: Wed, 18 Mar 2026 17:39:31 +0200
Message-ID: <177384710698.3709943.4935089017687987129.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260317121953.1100619-1-alexander.stein@ew.tq-group.com>
References: <20260317121953.1100619-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfX3VK4Y8pt7fZ/
 1reHeiePe/5HyXFET6jQJTH+wgxZKsoPNE9jWkpBqTPAmnG9Uls8wweJ+IKJ4qrrQGi8BEN+j/7
 iw4+aY8jZE6Gf4YH/U6t0/1tXm2oZgntu0nuS3EU4wFHlK03uB6JVcyotxt7isdeaJfyJG06A94
 2z4qIkteRBj42tqOx0PHgpzjH9pgukGhEkzcT9u2HCMsSjqPXtZHgDLnMzsk7AmQ1siaAavjHvQ
 7Oujoxaa9FLRkhEEMRELep17eGpUtnqoxR9utz1qM0y0kFadBXm0vh70tWZpg6PZvgnJMpooMTS
 65FHdQXl39QhKy7Aw+pvcDoQUm/t/CPp8UdbCLz6hReU8GQUQAzEb/wfMjHLKgK4ONadNH1Qcgs
 p3svJ2AlehVh7ee8sxZlQtvPPdMR7okH7PGVyd/wdJqoLrXE56RCJx+o26ngYESftBdNRbhyG4x
 vX8D/7rhOPVy7dTyVgw==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69bac74c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=r2wPyHcE3phNYcTLgkQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: MpLnxRVW-73WUwAqyE9p7Q0_XC7CtkN6
X-Proofpoint-GUID: MpLnxRVW-73WUwAqyE9p7Q0_XC7CtkN6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_083956_552054_A62D9D3A 
X-CRM114-Status: GOOD (  10.44  )
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


On Tue, 17 Mar 2026 13:19:52 +0100, Alexander Stein wrote:
> The debug outputs use %d for clock rates resulting in negative clock rate
> during rate calculation.

Applied, thanks!

[1/1] clk: imx: pll14xx: Use unsigned format specifier
      commit: fca8688a6798f6fee6b86ce0bc39d1cd0b1c8b8a

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

