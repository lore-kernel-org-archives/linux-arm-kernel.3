Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDAACDE012
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdCrsB5kraxwFS22WcsgSAW3K81gUc/ZtatyV38hTOA=; b=kUmV72wepEFfuUxhbZ6t86Eo67
	1EOUYdi4W2KojVwej4OSf+u7I+mjWeUYsGuhWYK87CsFTFw2B/wgAZTc/YjrFjn7Fh5vSpd4vaag7
	W/ke8AijixJ8Hkky+iCKBiJVfdR1jt2z+B0Eh4IeQ3iFU7TeUuV3LL1URf0PWqf+U8xaQHyyLpLI0
	nipvyfZKI3cSQDnxKmeJRgFVG7kqjiBh+Q+CrXIAV6ggT7yTy5GE6d9mCYKlpAvYF6xzI47j+Yfyd
	VPLImGdDcG8MYR6ANjpdb+99GRBhTojQ5YnZdlqskJAvdFJs1tq0MEV1aB7Tw7tiIdmoDnx7TY77r
	US9ELxiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1OF-0000000AjMS-33ph;
	Fri, 26 Jun 2026 07:54:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1OD-0000000AjKa-01Ml
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 07:54:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VawE4193245
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 07:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LdCrsB5kraxwFS22WcsgSAW3K81gUc/ZtatyV38hTOA=; b=Juk1RPdRP9NfTSa3
	LHDLo09QanJHICW7nNNgBP4gYqhmvvebZQglUavidgHH33KLQxcRnQPg/sy2g8in
	GMy6Lbb6c5wPwDwR13jm+OktHX83hCMZ0/n5emJZZjsTAQzd5M/7TGftSQ8bv7Lj
	UYsw1uO6rnwrMXHgWOETiHhZJoe6FAL6SkscQOrjTixsniDfIVBy/YzpQP42b8oV
	mWv7pg9ASmi7CJ62sXYguicukrCiq+CxLlmBAKISK7GDxmw3lIOCrsk/CdBjZmzh
	W0Wxgp5OfPDvJajxCjd58JBSWXWag2sfDl7kZji3hB806L36fvvfTnChdtaEa1r9
	6IDN8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdse7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 07:54:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157d38ab37so63756285a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 00:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782460455; x=1783065255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdCrsB5kraxwFS22WcsgSAW3K81gUc/ZtatyV38hTOA=;
        b=XH3LLzpWAPvB4rr5n3TkEUPvoUu5q3AJwzN7Ia3QtfvhMpw0VFwwVSQRnJFPyOVNNa
         mlvRI3L0n+O2y9qrhCEwQX+yWqT3UlG/d3BRhXt/sTx7HxDRp6WpDhTfvKtmPoNdgWiN
         cblko6sJvPmznUzN5sNyVbViFeU6kZm8WlorT5Ak/AiOJyi5QJY9VCOwBGMQ/KyiNz0W
         cVeFJanucXSo/2XqA/Wnf4aENWYDzkZCmTp4U9w8rXTtlPayCCaWU9OdtIZ6dR0gxuxe
         OPDNL7yGSBlELpv0rHRhT46Siif05O9lqNB8YfFwAA/Se9yI/50tAJnBw98GWumufgM8
         coIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782460455; x=1783065255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LdCrsB5kraxwFS22WcsgSAW3K81gUc/ZtatyV38hTOA=;
        b=AkMHNCRUvF0COnSePSuhb/mGKwcjT69kM+bnNW7Br+kIG5fl0+PpAkcuJV08fPRs6I
         kXqg4LCBhcdV1Xo2zk9ooGMnUOuXw+N28no2+W8F3EQoe1EE4csZ0AjeuTqr9aKujrB8
         E/X2vUzBC7O9g6psmxa5wYbOWWmsbetOFwyLxs4NirJSsANQ28yQgb1Jcubae3D4qXW0
         rF8ZS6WhFN2PGVzzOmrWFQJuaD/3AcaljrSchvNlJoArNZ9Wp02awPjTcW12xP70PUf7
         H/7QGildzTAIDD0ZM0mSGtK9eAxi0Y8NWjJLn3YY0xe9eoeOQ9yJ5vKP5MSAcneW7Isx
         ES8w==
X-Forwarded-Encrypted: i=1; AFNElJ8jTvSZtPXp4GHykp21nQA3yjIH7xaAfNylJIFs4pgNWU34868sScpZIFD7XP9f53bNAqAaSFgb5UbSZj7B7mdM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmi7Y5KjDmlGTnmRgtdDg//jK4IeSe+hXwJkA4jrV7+GsWi7/T
	YnGx8QEGijnZv/7cJtIduPi8LZz5WSJDFIH1IKtKgmRZ4fSDqauD1qNaFV42OJNmLO0j8dnqxz3
	ZRl7BkZEtcSOtwYbyVRks6IzxkNOA+3KzPD3H5G+Q5WIGxFDfhve1JuufvkpkSzYHFbLc2tfjm/
	nfdg==
X-Gm-Gg: AfdE7cljEm+rI5B51hogOF5yEwDJ0dAzN6Kg36Vbtm4aDR74xMCLJ8jaceXOSDtZ7Nf
	ct4De0D/937AApvbAhUbVFYXIqmvy62elEOK1v2rPBWpZp1AWgmGh1cpW1IwDu478oDYf0MacHi
	tO7v1TZem+VyfBDlOCjfqJVaT6zrCmyVIXKPDRL+KWtEwaf8DQXk7X5/zLwNIyWp9a/yXBBsqBi
	mE1E+53SzbSshSo0as4HRGBGKCh51W2oHi9ydDGSdPOEwVEzjy6hoQDCHfNPWGkklOsCQll4mqp
	4TjIB2E6+M5cDhzVJlA3PJdmCNSIcv7vRVNpUa/CCu8jys93AOvg3Wb/ZrPYx2Aa9/KMJPP6V0P
	JN1mZckJonugP2n6/r8EJkp7E5UvxNlDwPidLbos=
X-Received: by 2002:a05:620a:1b8b:b0:922:9cd7:897f with SMTP id af79cd13be357-9293b477292mr892439585a.4.1782460455063;
        Fri, 26 Jun 2026 00:54:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1b8b:b0:922:9cd7:897f with SMTP id af79cd13be357-9293b477292mr892437585a.4.1782460454595;
        Fri, 26 Jun 2026 00:54:14 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d8a4:9330:ebc2:b0c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492690100c7sm62053745e9.12.2026.06.26.00.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 00:54:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Marco Scardovi <scardracs@disroot.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Heiko Stuebner <heiko@sntech.de>, Jianqun Xu <jay.xu@rock-chips.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] gpio: rockchip: Fix generic IRQ chip leak and modernize resource mapping
Date: Fri, 26 Jun 2026 09:54:11 +0200
Message-ID: <178246044597.6231.3111036547946708998.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260607230504.35392-1-scardracs@disroot.org>
References: <20260607230504.35392-1-scardracs@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3e3028 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bUU0xQWC7lQednYWYacA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA2MiBTYWx0ZWRfX+D7leD0we+93
 WRBLX9/2QoZjJE6bPwXtPIGdjTg4rgXirclqBhQLtg73Tpl81KouL3bGo5TcsiFE1wo3ZL/fiTv
 7+rAu2F+dg28xFV1NTwlQG3UIpIeyUART1uKDuV2+QlAPNZxz683OeHB30DIY/cLa3kUbTA2utV
 7JjDKyY9WTo2TXQm9NqEv2LJs+P96W4VHKJ3D3OVf+KSz/JhNvau1E+4VQaLekdlD/ue3T8Cgdz
 lgRnvGtSYWEjqDepMgAIqTqe7bBlMiKIoff0xHve8YQPvH0I1vVZM5n+3WB8IOIOoTlxi5+QqJP
 JdkLuoxVPDmUON37Dcsj0IRiFFM7kzFYr4zeO1mQ58RsV1Dyze2Fr+BPiS2BpkPsZIp+bJaKr5J
 +0t/jbSvWmmMC9tWyr1MBqV1umIRzyQXpbM0L/Dkbqc9/SVljxN0TdyoXHULlEyAhpVa7iS1l0u
 ak976FrQAtAEeqCgOAg==
X-Proofpoint-ORIG-GUID: 6KoktLVeFSTYmqdtSCPduSrhKUujlZRE
X-Proofpoint-GUID: 6KoktLVeFSTYmqdtSCPduSrhKUujlZRE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA2MiBTYWx0ZWRfX1NQjsDjkRrfa
 gcMJliZ8wP9ltkJjWhbleFNDOc9SZQ6hpJBxu7qE9BCb/XEK3GGVa6xWLpdRnQZU+eeJJD61cn/
 BAe1R6OsPkfgst0ob8uEx7GLAz07/Yg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_005417_040654_319596DD 
X-CRM114-Status: GOOD (  12.76  )
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

[2/3] gpio: rockchip: use devm_platform_ioremap_resource() to map registers
      https://git.kernel.org/brgl/c/c03c6a086d188dc5b52e7db2b2991ecead9bb669
[3/3] gpio: rockchip: use platform_get_irq() to retrieve interrupt
      https://git.kernel.org/brgl/c/c2e26f2408226de7464ba4cdcd86827e0a000db9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

