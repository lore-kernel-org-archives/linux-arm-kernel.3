Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9C9C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 23:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/QuFRSQM6jGskvpikRuPMQOLWa3drDNhXx6nuoLZqg=; b=sMx/4SWgyQ1Bwe6uTVCyYZEvtZ
	rsiUbIa18y20ek+8zXbHPjiOftpyAB/+btA+i2ODsBCnlDD1p2gJ0t24ehEuYhHWoAawl1oVbr+kC
	aU+uBbgnHqimmlZ8CV4vIMUA3psipkmHB4kpAO2mFugEUjlQZpiFi182ejJB8pyrayOwNTs5KR9Cy
	2P8gukFtyM6sFL8FJ2B1kPyCgeA8BQ69cCdqomnJypKx3v+8pJ6tQSyA0+M/10ddZcl17GVmf8VPB
	JktIIYdYhEVfn8WqG4/i1cOVi6XZPUKM0j7MNXndZ4hUWNFtCHiO9YeebsMyJ/tjJiJaLHyVPoCKM
	rXb64E9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkVFw-00000000mi1-3sTT;
	Thu, 16 Jul 2026 23:12:40 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkVFo-00000000mfy-2YlA;
	Thu, 16 Jul 2026 23:12:34 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 3F95BEC0089;
	Thu, 16 Jul 2026 18:51:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 16 Jul 2026 18:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784242309; x=
	1785106309; bh=m/QuFRSQM6jGskvpikRuPMQOLWa3drDNhXx6nuoLZqg=; b=I
	9Z+S1Jbh8fSe11k4PFZ1HDPDPCV0jeQvIHeODEQntFh2PR6SG7a7QK6ymJ9VPbMW
	3ejOoCW3JamQjg/Sb88Am0vhSrBmxNGoUDFOhFj/YHgtUFz9r7HqKcmtT7F6l23j
	/RoYsEvOcEpSzH2sr4/Uo38M7B4Sada1SIScA0G53MMUDwFQQBQAUyN9m0yV5oFq
	1cWmnvFus0IEMnFX3g5DpGF/3tbaD+zUiNXDfJrtgSGh+SwRtCsDeTKBJsxn4vFI
	39xpXHUq6/jq5JxMh59WR8d0diMKAw3BZY9BlCEyebJxiEm5xO9Jz2iU/m6mazbT
	XrtCHUAPgDKroPIxvsxgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784242309; x=1785106309; bh=m
	/QuFRSQM6jGskvpikRuPMQOLWa3drDNhXx6nuoLZqg=; b=PWI9MLRrWAKH8LvwY
	MD0XzwrD/Q3MYlT0+Uzgyw3a6h4hEt11K2rqu2ePK73hDGuNjsM/hc84hXr11+od
	HInC6JqXt+9TPUcqeqzcOmVQ8XVecL3gRAvgtC7Yn41z0WV0lwMZa1ohMcnvxeVj
	89ascf0fRAZviF4Pf6aS6q1Tx2c9c2p5O7/PqtdI4eP52CTgowS9jtpzPy18NZ03
	Ei1uTXm9JIVsSpTC70B0d+LnrN/b9knOib9O/NtWIJzTbfUKjE/hPEgVgFZ4E87E
	k5HFZdj+v86q2f1M/tbdUjGbTBbJ1eplp63Nv/i/ZeDERl47L/6npw1Z3WaR0tRv
	XuXgQ==
X-ME-Sender: <xms:hWBZal699OaAIKlm46-GGbZcmGDka6KMPMXj6q1jHowQbcd9uskp_A>
    <xme:hWBZarElcRE88ESna4uy1rxzxRz8hinGA5i_MsVR8hk-vWYKdAfMMGDMIqZSEndsz
    zobPjEYrAwMxzlgmK9pn-UTd_qhzTKKyV5gHeLKwn7Pe0gysYqHjUo>
X-ME-Received: <xmr:hWBZaoDUsNttMKk3UGHiPx9_-uW75OYeUS89xU2OhaR_VnBFKHxs8pw5w8jXWqEnDoFMCvVT2jAG9KKl38g>
X-ME-Proxy-Cause: dmFkZTG0kLL2r3BGP8LXEPxN2Zb6VvSqQ9uCR8eBin4CWjH1opqEBzK+o7HzQhPMU+8DaU
    Hg6S5aSkKo2oLZ6tFycACl68psHaw+rt60gPT+fiE16kWsg5izpHh5k+kicW2vIjZlcypa
    ckL1HKlP/PKtzdDCLGSg5ZG1R2AuPb3zfsqqh+cOgQ5JCjK7unJu2iCeXsP8flBJGK3Lzj
    ki6Cj8SbJN8jf9b/dETi4UJdSOAzfE8vmZ2WIfwJTICY+5sDmt37/UaeEIquZwIu7z5hsl
    ohrQyrU78XzMUxpofzdCqnp7o9RJjyG1PHP1BrzoTHTwRuQDuyPkP/u+qlRLqfQSXyszgG
    tSZES5+oVmhrA6az+Mu6Nx3/2xBwZCpmM8igfHOSLPO+YgEE53MV1+g4Brz0OunsfOEPwR
    RYXfcfgOpz/6I9jTL5wMS6WkUkChGZYs5If19MKZVGQV6pTQrOtciuFq6JNaqdcgkY3CP5
    yMYLOSuV88bjAPNGt31BOqdjVhWHiXegjMUDMzLLnuh5V2fD+WE+c+N+FCP5tkGVHEJmUj
    NY4wCKa9XaKVRGzjgAzO1JyisGqjpRVjR+VuAY+ktuwporWwnxgFt80HUv3giIpuHlzXHE
    WIB3AEy3DWt5n67h+5r9fEvKfTPRDTJXfipZcL8jNi+qUra7bNVcLDB0QrSw
X-ME-Proxy: <xmx:hWBZaowArrFhmUm3w3LhNEbfCsa1hLvZKRwjhc8jJL1stbVGhm9D6A>
    <xmx:hWBZak5H8tt95k4mgQt9isxVxBlfPsbXcw1WjklYVgcaVNyIDBH86Q>
    <xmx:hWBZahxDBamjrXe3PPC0L2umTL5PAohPVw2qxHS7uLScgGgrZgX0Qw>
    <xmx:hWBZagfWI6cZK9BRPnCHsjb5YMU3wl6OIfbVZiX61f-jTO0kirzrUA>
    <xmx:hWBZatwddIYE4_Vh0kdLZfYYdvPs5k9xWgeddlhYXGF2Us3c1gxxioz0>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jul 2026 18:51:45 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Fri, 17 Jul 2026 10:51:43 +1200
Message-ID: <20260716225143.2544913-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <40552860.10thIPus4b@phil>
References: <20260716095101.2498464-1-gahing@gahingwoo.com> <40552860.10thIPus4b@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_161232_840257_9A914077 
X-CRM114-Status: UNSURE (   6.68  )
X-CRM114-Notice: Please train this message.
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

> As Rob said in the v2 bindings, please slow down.
> Additionally that is the 2nd "v3" today?

Sorry, both for the pace and for the double v3. The second v3 was not
intentional: my mail provider accepted the first one with SMTP 250 but
then held it without delivering, so when nothing appeared on the list I
resent it. The provider released both copies hours later, so two v3
threads showed up. I have moved off that provider.

I will stop respinning and collect review first. The next version will
wait, will fold in Andrew's rgmii-id feedback after a board re-test, and
will be marked and explained in the cover letter.

Sorry for the noise,
Jiaxing

