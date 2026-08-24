Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7793FC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 06:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROwzLFkAwtTrfltmkckqtugY5BGlQdk0vedqqolGcRo=; b=YMTX4obJGWfjkZg/eYTsGPARw4
	i/wc8oIH50KchnxS5erwgzM1IkPA+GhKlwrRGmOjoUoqeJYhcS1NCrAPP/GUXlorYq0hnjlcpwAKg
	zj9qItCE/u//++5+v7furalBA+pdW8SZ0ReSeWhNSlpvmMAL4l1CSM/bHydVLCLsxNT2VNuSDQ3U2
	gNAe+B2HFXecUgbKGzJnJ9QRkNYCajP/2n4kuW/HPdxMT+fQ8jprQlA6vnsD/nRDTKQ6ul1jIxFVU
	5NketUC7vhGp/9Za8CYCKzAaoRp8CW3+nI6/WD8HlZVC0+wqyhvyEjeDAIAbWAsSnw6IT2bWprjy1
	GQ6CvEig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyOTX-0000000G1GA-45Mc;
	Mon, 24 Aug 2026 06:48:07 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyOTV-0000000G1FZ-1cC3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 06:48:06 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6a17cb94b26so5878443a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 23:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787554083; x=1788158883; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ROwzLFkAwtTrfltmkckqtugY5BGlQdk0vedqqolGcRo=;
        b=DEIW2WinR3NSMjPtfXFwSlhmtuuR12XuPCbZxOof3hxXfct6B0w1KpupWAW861wKP0
         3rQNbYXrpKgFz1ii5DB8nyR3dY2450J0r9wh2SFnBTp5jYYI7vdoy4BZiP6yvJpD1vWN
         CNAO7nSPsGS1tHDSlsaZgacff7kE+bxXHsDzwLkyUQi1Y9RVGszlc/Ba4w6EGNPJPX1i
         Fer91hb/xvzuOLLhBm5KAVmKbzJIfGQk2+u/bCwOJTewqLh6880sRGrGmvf8YPE3RoyI
         NWqaT/pJDo+xcU5UCJ5GG3ZMYIsr/U1HKG9TChA9D6C6kJJ18nNgc5/XHq52klEgLnCh
         EvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787554083; x=1788158883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROwzLFkAwtTrfltmkckqtugY5BGlQdk0vedqqolGcRo=;
        b=aOymloo/mbcN4FHjBLcnRSU+GJfX6ABubJBvpGc9k05TTNWm5ENKi0DWWD9+wcBZey
         xOGFmO37jyL5XFCXuHJUDOHEt1wGApSxKdXvNRS7KWwtdFaLoA+W4ier9k7Mqh2Ldh6K
         ZWzvIaT2tDomMlIjGb3JOVLH1SjUpcAbbYu95PasJeylCh/kZ1CzaByLuXmfmt6s8ubi
         FuXBFmr1uQ6Fj5ddGrFgTy8RgrXyJYck7Jn9eA1GcUrltPgnKgA7AwNP2QKKfr6MGIzy
         tU/jq3c7Rg9BJtInD20nyW6ZIooKI43Arvyl2yLfaHG3iqti1b/Op9e/xGXfP2cm12I1
         OOJA==
X-Forwarded-Encrypted: i=1; AHgh+RpUJOok0gLA+tSNrH2G1Ep/Pjv6hn7Ab3FbEsq0rtHKB9S1s3dP0uXtg27oJ98zvFDpZtJdUzkjxgLW1REf03Or@lists.infradead.org
X-Gm-Message-State: AFuF++n/ayabYRYhzYb3jBqFWEPiz6ZTr2yCTE0/C/oC5J6PGYuBlChr
	2u29PTw7oZiRnJ2VZUKNd/uGOuyF5ARIMARVUqob7IGRsM9gxcUHvvV8
X-Gm-Gg: AR+sD13YHLoyDNe8H5rQ2ayc2gnyWX3FOp1AAu9ZSh9jQGU8QBMmsYwitBvAe1wA70F
	+Dq4WdphRVwtCFs/Y0um1Ut1Spi0TOfvcjOPDklhDOeUUvuPwdPyD3dwGRHJsGeC01xMOOvtO4a
	fbBvrSOoOFFmw3FokhuBZahc87XNIQVHPBB31i3WkG7g+ehjiYUpwOjdOljIEeAbZo0SUX0mcCt
	vLyAgBny4tOp21SH5g99dMFaE0v8eI/AzaCHK2lx3Ee/N9Yzby09IuPD0QqNVfZ/TCGvAw5Dpo3
	ZAf8ZQ37AhLBICxOjTITKf0cNXZWyACDaMGmPFoa70OmLvhGksq0vUghMHrAR66FGOyIUcD/99f
	xm7bKbu+mM8aLNY/htI7LHf7tJ4fjgGNzwsF/tWKqFNev+S2kKJ7VnaBiEmT6/41D36Aut4Liqc
	kD058SBqVClGoztAVg85JRimg1EqLAQbhGgP3LOCtoeCwhEom45sSsaPsGRQhCxzpB
X-Received: by 2002:a05:6402:4498:b0:6a1:44c8:edc4 with SMTP id 4fb4d7f45d1cf-6a42f21ee3amr8021391a12.12.1787554082677;
        Sun, 23 Aug 2026 23:48:02 -0700 (PDT)
Received: from mobilestation ([2a00:1fa1:c28e:9a7a:6251:3e2d:4f32:3e5e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1cdbe9sm7097133a12.24.2026.08.23.23.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:48:02 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:47:57 +0300
From: Joseph Steel <recv.jo@gmail.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org, 
	joabreu@synopsys.com, yi.fang.gan@intel.com, jun.ann.lai@intel.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 2/6] net: stmmac: Enable double VLAN processing
 only when supported
Message-ID: <a77cwrdtjmzi6zextnlg7llrqh56behj6zl6jkon4ta6gwnbdj@unwirtt36qwn>
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
 <20260821170959.79708-3-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821170959.79708-3-ovidiu.panait.rb@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_234805_433684_4374570A 
X-CRM114-Status: GOOD (  11.96  )
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

On Fri, Aug 21, 2026 at 05:09:55PM +0000, Ovidiu Panait wrote:
> stmmac_vlan_update() turns on double/S-VLAN processing whenever an
> 802.1ad VLAN is registered, without checking whether the MAC actually
> supports double VLAN processing. That capability is reported in
> dma_cap.dvlan.

This is not true. S-VLAN is never reported by the dma_cap.dvlan
feature flag. Double VLAN tagging and S-Tag VLAN features are fully
independent.

-Joseph

> 
> This was found while investigating a separate bug in the double VLAN RX
> stripping path. The outer 802.1ad tags were unexpectedly stripped by the
> MAC (because the ESVL bit was set).
> 
> Check dma_cap.dvlan before enabling EDVLP/ESVL/DOVLTC bits, so that double
> VLAN processing is enabled only on supported hardware. Also, advertise
> NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER only when
> dma_cap.dvlan is set.
> 


