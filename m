Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BFBFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6aMwJMu8CDfvVv9PZpLjP1osk8nY+/traiatwRBLa4=; b=VJqKvwr739xkkphixwszVeeMjJ
	2QNr6c7A17QOVSmjF015Zu2b2jYd9S8y+tvTfpnb0PdhDkwz/7/CL6+9UEmL4JW5UI1XbQcI3QJ4j
	QnFI4sWz6s2j4be5jBMuP/BVL8DBtFo5g132zHWLj8USNqUVWGyEfw2Yk//S2hJdIFREITNGSvZZY
	OIs1lsxetcIX3HjZ2519BXMaK654ebAlN5gr68zSXvyTHxBv4XOaguaXzywvtLT48iBHGPkXG5RsL
	32mBeuPqUEI2+iruLNhK9kbz5BGZIV2yf2GV87zRbbA9jcEf9aRX3UGaupAaHTKg4FXE1qWMVkUrt
	HQEtAsbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdar-00000000rYo-3BAV;
	Tue, 28 Apr 2026 08:14:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdap-00000000rYN-1CE8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:14:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S3tl882006219
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l6aMwJMu8CDfvVv9PZpLjP1osk8nY+/traiatwRBLa4=; b=GwwfcYgQhvChhfYG
	SdsXS7ZIgZVW5Mbkk/cqSCOZ9391xbsqdu2XKoi3cum5ZDQyHvxGPAl0Z9i10sje
	hBcOpTURQ3Qp8rs1i6//Jx0F7vJZdUjMbUixf81Hdj6xvQvQxOHj3LQm7Qad6WYT
	KISF8nVNV9w+VPpb8FEnkuryLUPP81QPlCVadnvmtF7UPzsAmorYVyfKfBligzm2
	/Sf+BK2clFMLuwf3l4kk3UHb2rG+z+7/XY5NmcGZVUqJKDgttsHnAKxyXMncVAKN
	5o+QGgesbzaNTdeaGQhzvHwjGwt19lxTh3fpJ5qNsTAG7m5a/XhnHy+CzWtgA4UC
	tR0FwA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7gkm3v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:14:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8ed08aa4so94634611cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 01:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777364093; x=1777968893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6aMwJMu8CDfvVv9PZpLjP1osk8nY+/traiatwRBLa4=;
        b=XpRZwh9kYODrR9N7HiNK568+7X4AoFO46YK118WalJVguWbixh4XxRtqp5lEtaFilC
         eA6y/YQX994knZsuc0nfEFgUQGWCW4jbJW/0D0miXB4VONvQ55VftpbZg+CPTRSJ6Myg
         kjJCXnYkjlKEKRIa5NW0c3hS5P4bq8W6uPUqsNfB7f0pASiOjSFhx+wi2GE9gIfZy69S
         /CkYbX+IcjaUYtOj3eSBBupw9U+iNBln9W8WRO9j7+1c1lsomMqOMFObP5bINxER4stw
         +hNRE1EndXG9dI1/UBuK2thlWTavtaB1q9VUolZR9gc7GY4v4ZPlXyYjAcTzPML18rSk
         adfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777364093; x=1777968893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l6aMwJMu8CDfvVv9PZpLjP1osk8nY+/traiatwRBLa4=;
        b=fYyuy5OUkKHaTiyZdalOsYxwIOTDjT/mir0NKAVEcqgvfzajtDVZBGTMtZnBLc2FdM
         1ajinXSd1zSbuCawVJ8Nlj51y27dtR0/MBdx4FLpT4S/uBtSPCiNLO/UxJGHyNBvf7HQ
         xOFfr+PgBKe810Er0W9upJq+9zoqlfdk9C6yC+a+e0jQd++qBNt+AIsOrU5mQgVlSMrk
         OPbBnzkjqpUWzGz8z9lCkrzGbyFWfnQ9Xu1YmNo7JgPGLaI/Fn6nw3CS9KRiPhKRKSie
         /T6xiK3wmLCTukD1bpFcpnOZ8iOIBb6pS8x1+k7Ch9d5M7NK/dG+tGoevHiy1Z+vqJlz
         KUMw==
X-Forwarded-Encrypted: i=1; AFNElJ+fyTq2ORqM23T7aRo7UiGz/Na/vMvCPOW8DP25jfMYADRS0Ni/9qRW9zdJGDjb1PqthT44BZLT8VD1+sVpivFv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/nZI62wlXsZx0S6916jCnYp1sfSyQg9kFY+x/ibtE16I7dSoY
	jUDgU4HAgBSY5aerfKIZj9Js3y9XRSak5nA/vwHwUl+Tc49eRprKp4z6I6yGvIY+twv0odPKGCS
	Zi2fnDsJks0GwIDOV4uOpiB0BNFCs9NW6nZnRFbeJLvT1Sw2+IGus3qBTvB19X1uyqiKC5rbdAQ
	aOCw==
X-Gm-Gg: AeBDievCJcPSfXpPw5FQUl9i1xXa74f4kEG5op1ujUGujdCao09WARANlfWjduxTcxe
	YAOZGecfNT6EL+Exe5gzU1KgCBXBzhyxR/03T7tOve/EQdMKMPOrWvT9cCT43Nk0/JDhY4iia4H
	ZXxPO3YoF0bR2j8nWRXi8smCioTwYjXr4r4s/8SiBBLtxcW1m+tDsg9xIg8Y14Rn0K2TSbQk5z4
	NQ+NdY4me/4HeoVfe+3T/R7PhlxN0qQk6BlvCnOZi7pS2NZvZhkrIW3nfm9em5eA9NqUCBcARl3
	1wQ+H6tX1ckstsA47dpCGP03yFxyK0d4GdVaK4wc0wdpsFz4FQXaFqZLoWQGl9jyv5JwWPiY96k
	PABSqQmyTez+BS3B5GYGhkxo2Ogo3chNp4JE1oa5s0jgYcsKVrzVfxQJjQS0=
X-Received: by 2002:a05:622a:199d:b0:50f:b4c0:630f with SMTP id d75a77b69052e-5100e20ff4dmr25807951cf.54.1777364093396;
        Tue, 28 Apr 2026 01:14:53 -0700 (PDT)
X-Received: by 2002:a05:622a:199d:b0:50f:b4c0:630f with SMTP id d75a77b69052e-5100e20ff4dmr25807721cf.54.1777364092918;
        Tue, 28 Apr 2026 01:14:52 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7473:f19:2705:c566])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f4c07a2sm4605002f8f.20.2026.04.28.01.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:14:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohamed Ayman <mohamedaymanworkspace@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] gpio: ixp4xx: switch to dynamic GPIO base
Date: Tue, 28 Apr 2026 10:14:50 +0200
Message-ID: <177736404661.5976.17646360119700458695.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427214311.331996-1-mohamedaymanworkspace@gmail.com>
References: <20260427214311.331996-1-mohamedaymanworkspace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pTM3ZGDn0byb48B_3mKRzNYwqJuBtXp2
X-Proofpoint-ORIG-GUID: pTM3ZGDn0byb48B_3mKRzNYwqJuBtXp2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3NSBTYWx0ZWRfX8S22Ca5jaEKI
 v/Vah6dlYLRtr/VV0aooGyawFhrA0nt1NA39sBr82KHl4RSrrLPAk15IWOOy4Rygf6wgTbnDjBI
 xcrile2YcSycmbQwJ+0bah7gLjXoPk95B6zaG4XdSuq2ArsicDXVM0GyiObR8paRAhLNKNunRfd
 NOdbk3u3r4IM5HcuOKcy4UIgUOSz6u8/Wpj+BPSOYgp2+S4ctlBPRY2XRewrr3Y64VMGP5Srhhw
 12PTo9y3RcDYNbpYUZl+1r1uCrs0tbmfNycZtOXg/2AO2SJTVexnb3P6eZgE0kgLxVeK/EdGNOz
 59bbTliUjZNfIzws44xqnFb9DatOa2c2Ra0SuNZnctL3+yESNfDofo384PNwTfre10WLAIykrVk
 O3aihQxgGuiNjlFB+qnIDHLk+N9kXeL1nx/klTGHAg+aPVpK7pU8Y6CwqzZkvUS477hss0noPOj
 xMjYiXqlFHeUHdL85eg==
X-Authority-Analysis: v=2.4 cv=bJsm5v+Z c=1 sm=1 tr=0 ts=69f06c7e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mBJcc0Zejn4iAAP7EgYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_011455_440076_73C77517 
X-CRM114-Status: GOOD (  11.55  )
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


On Tue, 28 Apr 2026 00:43:10 +0300, Mohamed Ayman wrote:
> Most IXP4xx platforms are Device Tree-based, and GPIO consumers
> use phandle-based descriptors rather than legacy integer GPIO numbers.
> 
> Audit of the IXP4xx platform shows:
> - No gpio_request(), gpio_get_value(), or gpio_set_value() users
>   in arch/arm/mach-ixp4xx/
> - No platform data using fixed GPIO numbers
> 
> [...]

Applied, thanks!

[1/1] gpio: ixp4xx: switch to dynamic GPIO base
      https://git.kernel.org/brgl/c/1005d6e0257a5623ef79bfbd8f588b498c1cab0d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

