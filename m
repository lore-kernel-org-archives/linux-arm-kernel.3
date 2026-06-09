Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3A3CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2ZycUM2sF4NHnCdd+yV05hq4usltNMY+o6sDqF6H4A=; b=bI+237itXLsY1fFqRw8YmLEmNX
	BClr4f6EZYT3wo6ErvnWFLGyVPHfalN5ATQnLcfm+mFyWWe2tiO3pg300mkcYqDNL9gRbLssSc5jh
	cuKDcqQORdfdGMdoK7rpRhIduFCa11VV+6ArLqggAodinsTUqNmfAZGxVhID8n20bqkStYkKi3PIh
	aoKC3q4eMEnCNjkwx0FSNEdUQT6uCFPMnUw4MvXw4FMihk7Zvj6bkkYl3lTFLFi4CSdDTIWR7h8w4
	0Q3LmYeDIJsrgFQkFO7GfBGRgDxKg9JbeZRU/NF1qqGd7elKUnb3v76gSWkgxEESO5nn8ujHzjUcv
	d8XzxxCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuZf-00000005RAk-0Ucy;
	Tue, 09 Jun 2026 11:24:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuZc-00000005R9v-21ad
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 11:24:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xpSV2288124
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 11:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C2ZycUM2sF4NHnCdd+yV05hq4usltNMY+o6sDqF6H4A=; b=VKa3KD6d6rPTcQ/N
	DOj2iy76uxUSVU6IyT5NOPI2v5SZgwHGlZZBOVSzebAhUh7oeDy0VnEOhQcoRlUw
	BZ1fsmOGjyo1RBYcl+J3KaiAoorEoscZLyltDzuTynePTMFXRID27LK0vQXDNvOq
	4b73WGx4s+v5c9dnvUTtOfuw/01LpqLBhdzv01dFC9MCi4CoOTF3z+yqAydJtcqH
	Q0xwxtVNit2ODdYsRJ+CsjNH9s267Vruc4kQv+bLuPm/eWZ7OTuvU9G9SRr5afVX
	Z1ZtfSr+uuI4ept107238+ukbdM68qb7W1+x5CO4/m3x08cFbJ21WI9Ia0kpfH7+
	hMTd6w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25s1w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:24:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5176cc5bf2aso73818521cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 04:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781004287; x=1781609087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2ZycUM2sF4NHnCdd+yV05hq4usltNMY+o6sDqF6H4A=;
        b=ZJ/m9yKMh1lCBNIot/I4JNvxWYbrEkzDcTC7DYcVbLbBW5tl+AiZhov06tFLBxwhge
         7k1+IEvnBIGT3NfMutqPor/ko3AC5kVHTAwl2PwBsuPf7eXy3tpcBpqEyDzK9pWiPfiq
         BaWJE2W13eOurxPHY71z5fMB1r84wowBanvXYtajCVDo07P8a+63uPqbfi52lOYf9PcS
         Q5vL1eOKWM+JY9sZblLqk/1GAyhbUfEYnw3twPUJvRNc2JEYqXw4nKPpPwFpQrs6fRxr
         ugdk4MFE2ja56vT3PIEWpD2ifxXjggnH9chDiJnUcn7UsHAkK6o9IVYvHdVayFualC0T
         73jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781004287; x=1781609087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C2ZycUM2sF4NHnCdd+yV05hq4usltNMY+o6sDqF6H4A=;
        b=hjyRuSSkVfQ7owgo16DAAFrFBb5l9QELPH+gOsfxylU+2Smq+05AfyEmB60Sj/Md7l
         rQTny/MPD9Vo51WnJhIrjgv5qjxOmJodJUAngh74jBeQ0NMyqSZFaO7W437hm2iKtb58
         850ZmPX7jUkbuEMgBets4Y50GIfMbGPYOkQGmHwrVCmD/XFkBQyIvCPn8S2bUMNvabTT
         wTCRFucrVgYuJt0WTBRfSkOnKs+GKaMvR9yBLRO8N1H7xILV7Em0fGdqfas8kuc1rpLe
         QgSu3/DoXFXCIFOSKkpa5PgtS1Qo0L9Vl6cCq6VHxyKfwbQe60L/rCl0kCTqMyW7O90v
         NKwg==
X-Forwarded-Encrypted: i=1; AFNElJ+2LBjU3W7IabH0v5KmxXzc9WlYGqTMLBNAQFSdtaASakutH4ZSEg1shqeamNPa4hLLfgIOITW19HTIfPtzAIf+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtx9jtUNRYHdf9H9umK1iDxOeXvSjVbiMDQb772DYMidP6tAp7
	7Boi+7a8HaFi+Y4Q0XOHRVL8bZZRsSXQXefB+POwZI7BAVWrgBZ0a/mxNla4vpEzT/ROOVMYh24
	Y8UUNxeIB91Fy47SuSY4WDX/37MmW/RDllGFbN2g77QKkBn2gqmQ5b8kmVTgH1R36qQbqqwg28r
	CHHA==
X-Gm-Gg: Acq92OFmuqEWyZlgMFkiRNr4OsdVYiI1UTUv7s3kGJRedVFDVKndgEg21l+YlCG6SdB
	aM8aellXV64Ofz4WgeG4/nTJ1YLawV6MJulZaZ9pb8FPXyjmDsOjp+3PzLOrpR01i1imWoSshBc
	ArEbfG1D3w7Xo/gNqW5Z0AptDjXHkcTHKt0n5HZMnZvwYbUISNNRcArUZzETnCHIEG+F+VVrobN
	SSivgIUA+RrO0FtT3DMR4JgC96alyDqTxwZxB9s0ukPag9v23K2INQGTUaBlnQ0IKzWpY6r8n56
	PJ0n7Lc0RmkHi8lnhkCc0CamOtKuIR/zulzqGgatTjhcJYto66C/7RG6VVD9hM1u1npFkggCLlZ
	toNc+eWzWyRskVexe8a8A7Ui6/wV/5Qe0iycuNFzUjaMh/oyRw9yhdmDqwYRC
X-Received: by 2002:a05:622a:1f94:b0:517:626b:778 with SMTP id d75a77b69052e-517ca609d99mr31124641cf.49.1781004286783;
        Tue, 09 Jun 2026 04:24:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1f94:b0:517:626b:778 with SMTP id d75a77b69052e-517ca609d99mr31124181cf.49.1781004286240;
        Tue, 09 Jun 2026 04:24:46 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7c63:2aa1:b7ca:7546])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2ec711sm59688589f8f.12.2026.06.09.04.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:24:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Marco Scardovi <scardracs@disroot.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Heiko Stuebner <heiko@sntech.de>, Jianqun Xu <jay.xu@rock-chips.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] gpio: rockchip: Fix generic IRQ chip leak and modernize resource mapping
Date: Tue,  9 Jun 2026 13:24:43 +0200
Message-ID: <178100427596.130110.2423070495677836224.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260607230504.35392-1-scardracs@disroot.org>
References: <20260607230504.35392-1-scardracs@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iAclTK_li__0aM7y1VD_zYGbzobqK2PD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEwNyBTYWx0ZWRfX985aJIQvypRQ
 pF751MAeHLfKmf7hE8iLZDD0kTvqXtwxSnsTYwacOY9kF28e7cxWi9eYmWA47x2DRVju3fsiS/i
 9x6+HTC6Ifbg8e59mtXDGdZQfVwAHRSyY+qfqOUleQc1fJYfmHLk7GZ1mwb1F21W+S+jcTNXphz
 A+1xmEXUuftWKtRrji7GT4tNwfKLO5pVHVaWUB6CSqAEIe/j5vuljFqcuL0vj4ROiBRVMTd+c7a
 scRvgwlYHtQcu/LEFygt4fGGofGEMMnnhrS+geF9/H4aaMGPGnIeAnqOxhVWoICXtxgfOlgbDBS
 riZM8blBhCZwJrr31Mi272ahx4JkhmwQtBK0A1gYxLz5kIw6XnhD9tn++P2sqiMJC785p9Az8nm
 Hp4DrXxkgvO2VXLq0Pvwmy7R1csUqQWTkJvg8t8rg6x2YOm5N1ANmu+VksUK8LISU/S3gEc7mDr
 eZ4vznmk0KIwuZHVJ2w==
X-Proofpoint-GUID: iAclTK_li__0aM7y1VD_zYGbzobqK2PD
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27f7ff cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jhzgRxFtsokRwiMRIIMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_042448_641135_338689EF 
X-CRM114-Status: GOOD (  13.31  )
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


On Mon, 08 Jun 2026 01:05:01 +0200, Marco Scardovi wrote:
> This series fixes a generic IRQ chip leak in the gpio-rockchip driver
> and performs two small cleanups to use standard platform device helper APIs.
> 
> Patch 1 fixes a leak caused by generic IRQ chips not being removed before
> IRQ domain teardown.
> 
> Patch 2 converts register mapping to use devm_platform_ioremap_resource().
> 
> [...]

Applied, thanks!

[1/3] gpio: rockchip: fix generic IRQ chip leak on remove
      https://git.kernel.org/brgl/c/1c1e0fc88d6ef65bf15d517853251f75ab9d18c3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

