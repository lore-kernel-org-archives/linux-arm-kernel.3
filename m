Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA817C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 13:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVbl3Z9HVr6Uibx2P5f7A2CJaisyDJjFLYgGyEoH47M=; b=PSqTBMU9L012epD/Q6MsXTKWRi
	qzB6KwlWih+66p3nS3/drNt9xlvN/ZAD7uRKUQp0VtJq/hwkIRAI6khK1Dlky5xsHVxwbTxUkXlSC
	pxWfjQEEYrhTYXxoPZYpfhRdawpaJi18YHKJtvDexIED/exCNYFJXbJYpyrqAQpgfKoR6folXcENF
	xpHo0m5Kl4gm3FUnUaYqahhFtOzDT/DfcKinD2I2IfhU6PeQL4D46R0ATdcGMf/O20Z7pMTZJD3G5
	oAbM5mBiSPBgNnyEqZV5rJwTfDzh0O+IQc+9+mFbg9s3rS3bg6E4aHl7JlM0ZYuwEcFey0fWf0u+T
	g3OKQoWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZqv-000000041oX-0g0R;
	Thu, 27 Aug 2026 13:09:09 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZqs-000000041oD-3otI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 13:09:08 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-39c74c469e8so12032851fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 06:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787836145; cv=none;
        d=google.com; s=arc-20260327;
        b=TNAtqE449XKI9iwleaZHpqa5avRFfnvfMlkXvrB1C7Cgt3bNEfWjxPT5brcA4+F+Yl
         qgYxhYHy42eRNaJyYdUNED0mIaHM82aWfxxPplt46b3ykz3UIhyvSMIrv5fM5+fHYpRr
         isnvqXUSKjJNLViNiBX8R5iaWjqhZmD+zL0Mqbutxt+ZmhoTclJZrtVk+ctZOKnlX2sH
         vyIvQ+hL55pLrdnOVvwBcZg1W5M7Kp8E/iA5QefgNTQaP2I8ZOm1iBvcfwSn0t/EMKKf
         TPMr7Xvg9HpHeNuJS26FrqsK/M2jnAuyYegnErirPj6UW1KLRwC9UDlRlAQI3zkaG1Qw
         /qhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yVbl3Z9HVr6Uibx2P5f7A2CJaisyDJjFLYgGyEoH47M=;
        fh=jcZ78mcWCMi9WfoYWTC3T3RO/FZq+lYQG14cAtjpONk=;
        b=qqWmY9kmUfI8Ux2mMgnfd/YBglC3M90sBto9GeTDomi80Hjl65EtdJ8gG7KuMRPEgs
         o5Pp1Y7z+CX6sI1G1Lj/Qd+AZhhd2LjOozTdrQwTA/t8lB/rfonNwUFuQwWnIFI+g5GE
         e6W2IfT+tfLRx8zpQBGKACRpbrmynA67zByyjk+dLX5lRRge1vg+bYR0wiakIjmNarDk
         pOpNVS6gkqhgz7fjezINkWeJFT6bEmpIOlUziwHxsYh1t45oVDvmizaz4X8kl16uxTKu
         OYWeksUetRQoQOju3NXoHf2mFBJvlRCqpIPbOo0Z3L5EY2L1bnIna5gR1hUz6p155E+q
         qu8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787836145; x=1788440945; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVbl3Z9HVr6Uibx2P5f7A2CJaisyDJjFLYgGyEoH47M=;
        b=M87Gh/2/CKuHJ9ltx3zSTlGVSqT35ETsfkFrK1N+PI5Vw644643Z4/ES0+54HUkAih
         RBxl0Nul19c1DfICCich5CzOZ8DISIqJjpJpUQbt4pm3X6i4L4gbbrLEdCA6F7brD9B6
         eUMgLaol5Q83MWqyKsCpZdazL9oml6Dah/TCvB1XfhRAsNTsraz09surwAFmLCWjMOGF
         af6NLSRUQwjEEyxjzcuMqoy/OcgU8UIM8fql+V//7yAjPuvaOC980f/RML6tIlabENDy
         8tVR767+0ktd8ZZwwbd5XLYUIAN4KqtHvXI6Wrw8Kg4imn/FtAzD7OyhjbQzhG/dHQHB
         Ptlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787836145; x=1788440945;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yVbl3Z9HVr6Uibx2P5f7A2CJaisyDJjFLYgGyEoH47M=;
        b=WBiGax5omf17TTln3gz9Av4JK8nfYiPfJDWc0kYrc4py79CiYnllxuE9optONfm/6W
         RPygKRcRiBsBSqzupSbpQfahj69CWN9iCre4g7X9QtrF5mJytGIofjSC4GPGSJmsgtSh
         SWyQ0MmzdgFaa1TTH1+UevESIMFcNB3I+rPUncQp308ZQePmAi8pWLSj2qBnvxcuJuhE
         nrC8O1mwZS70YwW5/xKSpG9HLAl8RqWJq1RmLk/ig/oCPw7k337xnsT72JxDZvK7KmX3
         IQtWfZl6JPEDP6o/5wXzKhV+ebV35dImRFmLGbggfRirQFuKJDIBIH2dN9BXgp9qMKCC
         r81A==
X-Forwarded-Encrypted: i=1; AHgh+RptK5WcpfMrV7kcllcOyI1VHI1JUMNTqaC4tZObWlfiMTTSHo87HKKbi1a2hiJzHFfgpKTFsrjw7YRyJpEjq3WV@lists.infradead.org
X-Gm-Message-State: AFuF++l1u4Jj2aUcIMdOJQvKuPDzC/IcIw+EwjfC1IC1JeM9I6AjmZxe
	5wYG9h4sRK0UMjphCng9qwWFaQTYMKMFdJExfhLWbdQH2uZkYm0eMjKpH+jgvbRHcb1AEg9ORJ0
	U75n6ZH1enZiBp6yuibUYRh9dD8sahGo=
X-Gm-Gg: AR+sD11ZsPKk9APJ1OmC0iWWk6YNT6GBcBPaMxHPr6MAI+mcH7CTOCV8agw1shEwqu/
	JHsL0mUvM9r45AiEkwtesg4yIRHtLIEWCcKzi20DAcpiPyNfRXSKO9/q3kislTqPlnvQkhkoLem
	6Y9ZqxP4xEt5cJHmz6Zb/j3fNndOfmhMbPFkQ41vCa/fpbt7XhkwoGroAK6woHiHscMQtC/fJpN
	PvbbzEZ9Gc/fg2suCMELski8/L3GlJOIFxffAB9W20FQbmARGfDCinnkI8I8hD10lSpNxk+phWN
	QFJctfJ8atktaS6CBf4qOrtgcDE7/vRJPJrTYp894aeKZfSekcjA9UPa671V16SUHc5/wfXQLrb
	bN77fBjvRs52PBQjIeZF7Qe0S3dIrkucKeiciJI5BeK3X17gAvbEmEM+E+Q==
X-Received: by 2002:a2e:be27:0:b0:3a1:d468:f988 with SMTP id
 38308e7fff4ca-3a1fd453e09mr37025921fa.1.1787836144417; Thu, 27 Aug 2026
 06:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260821010728.45065-1-gvalkov@gmail.com> <20260827-helpful-icy-donkey-9bfdaf@quoll>
In-Reply-To: <20260827-helpful-icy-donkey-9bfdaf@quoll>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 27 Aug 2026 16:08:52 +0300
X-Gm-Features: AcwNN1UImZDtg3-upEabUa_XGggulmtbmlnjP2_UXhZYxbNMdjonIxEdG5ok4DI
Message-ID: <CADOrJmaF0UpRefk1+BDyn5iU5La4ke1gFWwzyRr5-9wp7Zr2+A@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: net: wireless: add flag marvell,invalid-reg-hint-in-rom
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, francesco@dolcini.it, johannes.berg@intel.com, 
	kees@kernel.org, miriam.rachel.korenblit@intel.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, arend.vanspriel@broadcom.com, 
	peddolla.reddy@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_060906_974120_6CB0F591 
X-CRM114-Status: GOOD (  22.13  )
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

On Thu, 27 Aug 2026 at 13:34, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Fri, Aug 21, 2026 at 04:07:26AM +0300, Georgi Valkov wrote:
> > WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> > from the mwifiex ROM, which conflicts with the platform regulatory
> > configuration on units sold outside the US market. For example:
> > - phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> > - phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> > - phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
> >
> > When the system boots, it detects a conflict between the user selected
> > region and the radios, e.g. BG FR US, and applies extreme restrictions,
> > preventing phy0 from starting on any DFS channel. phy2 works.
> >
> > Add a device-tree flag, which allows affected devices, where the radio
> > conflicts with the platform to ignore the incorrect regulatory hint in
> > the ROM of the radio, so the platform regulatory domain can be used.
> > This does not allow the user to change the regulatory configuration of
> > any radio. It only allows phy0 to start and operate according to its
> > certified configuration.
> >
> > [1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> > [2] https://github.com/openwrt/openwrt/issues/9956
> >
> > Cc: stable@vger.kernel.org
>
> I don't think there is any bug to be fixed here. Support was incomplete,
> so you add a missing quirk, but there was no bug in the binding.
> Binding was correct.
>
> With stable dropped:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

I added Reviewed-by to the first patch and sent v7 with these changes:
1. drop Cc: stable, the first patch only documents a binding
2. restore colon after Tested-on as requested by openwrt-ai
3. mention the added wifi@1 node
https://lore.kernel.org/linux-wireless/20260827130335.6606-1-gvalkov@gmail.com/T/#t

Thank you for your help and patience!
Georgi Valkov

