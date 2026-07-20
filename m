Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9ACC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 20:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRma90vk9cBe1MteFqC8fc2rP2On5MIBbYuESB4mqpc=; b=VF9eoTBAfmFAHF2mpATaWsLmqc
	Fz/8eAtkbxqv4clmV+L39S+cjXVHBXbfmQcSsJ3dhEILABrhXLy3vWQswZnBRxVtqTCor2tkMu7l7
	Nz0ikzUnITcSbhlAYlO+bmiz99GOtpSMOHnzEKyP4FSw0ZPMARkkmkj7tPdbofjfY5as4thZnrDva
	YNI9taDe7Tyw9c/a8VKWpcCFlCae1d1voIMI6YUFdJYzeq/k2mjipb3U75WdjUhhI/RYNtGb0EDEq
	22bAF2IddSZ2p8pIPyv1xpiAGCHc5gDSg17mJCIKN/b9pZcQMT5ATxSekgqdJ8hG9aFCryov+t2Wr
	BATBno7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluAM-00000007ojv-396e;
	Mon, 20 Jul 2026 20:00:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluAJ-00000007oiP-2Nee
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 20:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784577636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vRma90vk9cBe1MteFqC8fc2rP2On5MIBbYuESB4mqpc=;
	b=PcaRXryShfgAjh9vJemFWprgKLda+E8F2AySxNf2pDFEJs9Xz4ZUYE30DbBz6t69phzLYJ
	o5rqF9FEWbhQyp939HbsXVnb+7GNnRNoPNOvon8ZyFV2j8IHfBeheDZkVOfRIJzd0bXZ3J
	mYJ2hlHuIcstx+F+iE9iOVGkGfGGYDM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-HeKHCh6rPZWkwJ7LAJzgNQ-1; Mon, 20 Jul 2026 16:00:34 -0400
X-MC-Unique: HeKHCh6rPZWkwJ7LAJzgNQ-1
X-Mimecast-MFC-AGG-ID: HeKHCh6rPZWkwJ7LAJzgNQ_1784577634
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso156440021cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 13:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784577634; x=1785182434;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRma90vk9cBe1MteFqC8fc2rP2On5MIBbYuESB4mqpc=;
        b=fijakbqbPRp4dJ5kD8u2b2m7rIpUQqotHJady+0rivYOmid94dC660xSCE/FXSwGi8
         PjI6mcSQN/IsDFRNo1NPkWlmEYyNLrl6lQZ1VRDXnG0zp0wwVr2jhnBRWym2L/nxlC0m
         ziN2QZYUr3vWxncwo5lpOMg/x/BDwVPttrF7TFS5xZLolrQPr+VB1DuKtpHn0+9kjl8j
         Awxlo/80GqXWsYeZ7o6+2QjtNfHnHD5fF1a9G9Sbry0sGwHZ4mNqwwKHp6oiJJIHDDM/
         aEVRlstgVdOpXxaOFh0LXpfaKdgwvbC9QoepkiewqV6KE5DtPzKqvGdg0aD3KK8Uxt4D
         aCuw==
X-Forwarded-Encrypted: i=1; AHgh+RrD/MmQEaam+MjVGHnfn9u4G590HMdxfEDd5pGEj7T8b1Xx1IOTpULorU8MBfLjDP4U6cN2dTCrQ4hYdJ9r2qkJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7mVrT+ku2hRI/tXzCjHDUG/K/Ixi/ZGxrAKQGqlG0FmqDvlMB
	4rGASmaSqQhcdgT+4TUb+3PudKEh0e5/MSjgi57tOwcje+cCEl7fWnFyrLkZKxVdrF86+06XLin
	aVlHozOeTuRb81rL3gBAvDvF2Ss6/s5Qt4GhLyS612z3Sz/rQI2k7M0Hyl1FxojUzwW0K66m27J
	yS
X-Gm-Gg: AfdE7cnUE2tM4ePtJ7kNlCHtEePyxykTC721ivSfds9EbhWU4mlWo5NsM8ieI4Qwn9W
	yYJgJTwUK3nuLz1aySSFcBrf8SdTsqjK6kWFBn1GY6tGYdM7+q3bjSBMpQG5sSfNqg/G0Sg5eka
	1c6nkxpBid430N5KYp/wumu8jQ8BBc77cCPPKp4x4iAKs34Bq32VrfW0lDX2EnSavtstPS2rM/V
	ZKuQgXir5qjP7YQsYHX+l1M+EUKVb2uuOT1wzGqQqWlVRQ+HS8CA9RFIMmDJtOQoNOPYp/gsgW/
	Pu1W/Mvbxf0vOl7ypOpi7NC3l4YsXK+efmxwQV48csMcwI6D7iVvym/eooV6a2JSK5JtCcAI7pd
	UEgeMVFOz3oqxOK5BFRShTM75wEg6by9OUWg=
X-Received: by 2002:a05:622a:4111:b0:51c:257c:8164 with SMTP id d75a77b69052e-5213c5f3e47mr144964621cf.25.1784577633564;
        Mon, 20 Jul 2026 13:00:33 -0700 (PDT)
X-Received: by 2002:a05:622a:4111:b0:51c:257c:8164 with SMTP id d75a77b69052e-5213c5f3e47mr144963511cf.25.1784577632627;
        Mon, 20 Jul 2026 13:00:32 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214f5fb88esm81796841cf.21.2026.07.20.13.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:00:32 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:00:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCHv2 1/2] clk: stm32: add missing bitfield.h header
Message-ID: <al5-XWhDkr2to7qt@redhat.com>
References: <20260719215040.767232-1-rosenp@gmail.com>
 <20260719215040.767232-2-rosenp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260719215040.767232-2-rosenp@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _Lx8xXnJSdI9QSoxxmahYNl161M7rjSeL9USoh5EkgA_1784577634
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_130039_706045_C5F6E6B4 
X-CRM114-Status: UNSURE (   9.58  )
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

On Sun, Jul 19, 2026 at 02:50:39PM -0700, Rosen Penev wrote:
> It seems some ARM header includes this and the build passes there, but
> nowhere else. Note that the driver has COMPILE_TEST in depends.
> 
> Fixes: 37ae8501cdb0 ("clk: stm32: introduce clocks for STM32MP21 platfor")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


