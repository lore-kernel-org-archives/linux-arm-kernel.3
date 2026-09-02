Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0CDC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X/zkz19mYdkeVUXbqG+wllW7/Eig24aofKrfzLu9lWI=; b=dZ/JtIzFnW4B38G+WxAPIFBX1t
	tSAtFkyX8xAbqfdSuBROoEcbfbYaj9XRDRw8pPTS/oRaVxGkWso14TpdaRE3mMb/7XUDC0I3VjgOZ
	sVUqNX1VfFbaF1DgeSUpCNNMuw7CKj+t1742cF83RI1WTH2oECqeqM7re8irQVtZ5QEYqVhX978L7
	wvOC30sgy4/EDv5eklfPo7sObSjuvbUsk/Nf7gpKQF37uB59dwjHipWd1TEdYsBZ+dPb6FUx5VSUz
	UL0b0NDAUsHY5Cq18JVxwIa13251ezsQXOh7fpHkDVjCCzH1KqKuwBjDRmtcaypV6vIQsHJjBWIlQ
	xOpRRFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iU9-0000000EOEr-2rLn;
	Wed, 02 Sep 2026 10:46:29 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iU6-0000000EOEL-1dKx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:46:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so12670445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 03:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1788345984; x=1788950784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/zkz19mYdkeVUXbqG+wllW7/Eig24aofKrfzLu9lWI=;
        b=O5Kao687NgkqQxN1kp7X4i5pm4BJDFDQZNHqOP086hebGhVa3Lwp5Y4nghxIuPub5S
         jXK98eNP9+xCVcAv5vdaTM51ujrFD1gkHHyX+WaxIivzbXplvKQBD/G9uN7uwpWDYPzD
         Tal5NpcAzZtZ9DkOIRn44LSZaM5NobQfe+C94f3e5NfO5WWklie73WBWtmpJhMdWpVAM
         et6AkV/tjdVwndeS76tk8Yr7E4eBodYV8Tn9fT4uWwAFDvjPVyL/z917jzq6qtFvqp7B
         dbP8JqLJ7QFPb3XDlqhplu1jDyKPY8pNkKGQ15QAJ2lKqf6PvQ+IQeqHfo0dyGR9SZRS
         o5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345984; x=1788950784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/zkz19mYdkeVUXbqG+wllW7/Eig24aofKrfzLu9lWI=;
        b=Dx4NYs5JJALF4Tk85jddw5jWNJaEbD0Fs1/D4R7dl7TSNiXHNFo3Qe2AxRPmKZeZR3
         4yVfl6RXj0uR+I3QMic5EO6veviSq+HdY/yM+yhtfPqEnZK8x3TVmG8ZOfvtgtqnOQqR
         PhMYDkyUkcLMEeIs3glOSSSQWiAM/mB94i6qzsFo7eRAGRETupYEqlUFRToZVXXMUFQp
         5v8DyZHylu6qqYkOVas90IQPwpD02frHXzyf30oKNILlG3Fv3vdn+wMc9NlI0ais0wh4
         HVO4/IaNb3GaaEy8fRJPncJcZm+vecTR5VHV/CkAjgZTi0FmLbiF1VDmkrr3SRuH5P5q
         IS1A==
X-Forwarded-Encrypted: i=1; AHgh+RrEr/nAFbuJ76z3u0uxvMKFvmLwul8WvI9KO/4yeAVjExv+QKYRuJbqJVN4ruC7cPOtybUkagqnB9jMnNHz3sKd@lists.infradead.org
X-Gm-Message-State: AFuF++mBn9N9VngqotMr3rdBR2/CMddITuk2S4uwCuO8i+IavQdNfmEM
	nrnLHWL9+YmIbUA9aiR9kBUHBBCzegGDm6CLrGfGqYBpHLMMkZ0GDtgFzgBYbvXVhXU=
X-Gm-Gg: AR+sD10Jdh/4wl/d8ikHUspVr/pF+Mpyo+BTSGeQrIffwInF5++/0JR6T7rfOY/G21C
	DoemJbQlfYJZVBxKubrsAaGjNkUNszUQ3/6EOV4GaBGwocDwU+AD3YuzNjXutO2B88FtjtGhhIT
	pHp1dmoXddtzZST6JBZOnrX2HIJ4tSbjpmrqOreiEuAZq3H2eC2cREVvxpYIGFVqo08NDGcat6I
	4ML9aQtCSO6YzW82OuCzKR5xp0lFiRd4m8x2de3V6awT1uq2V1kgDzh7XzfoSRaCMjje7wcqfcp
	hFoZg1HAnSp/leY27WFmQDcLf6F0/JwI1X6e5YY+hNgXhX3MCnlaM9qDswmXQaZsJvkRKz3F32E
	OvjkddydoArEXkQRiNBeaXd1RKKmE7e10bMHvVgL3G+v3+BqW86blgAvTpvujalga1AUu4TTcaS
	TVyjdqb0bLS99Hfq0uxXusDvxVdui+ayWSS5A5yDE3wl/xtiBtXV+kxPkJ0SafzUfBnfW3Bx2om
	n7AE0vMasNLmi6zMBFTJw0=
X-Received: by 2002:a05:600c:8718:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49ce7c03f46mr34819935e9.3.1788345983519;
        Wed, 02 Sep 2026 03:46:23 -0700 (PDT)
Received: from dev-ag.figment.co.za ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5936a5esm20127665e9.3.2026.09.02.03.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:46:22 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: qinjian@cqplus1.com,
	linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	devicetree@vger.kernel.org,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH 0/2] arm: sunplus: add SP7021 LTPP3G2 board support
Date: Wed,  2 Sep 2026 12:45:43 +0200
Message-ID: <20260902104545.67794-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_034626_679490_3B638022 
X-CRM114-Status: GOOD (  12.94  )
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

This series adds device tree support for the Tibbo LTPP3G2 board, which
is based on the Sunplus SP7021 SoC (quad-core ARM Cortex-A7).

Patch 1 adds peripheral device nodes to the SP7021 SoC DTSI for
peripherals whose drivers are already upstream: PWM, watchdog, eMMC,
and the L2SW Ethernet switch.

Patch 2 adds a DTS for the LTPP3G2 board itself, enabling those
peripherals and configuring the board-specific pinmux and Ethernet
topology. It also updates the defconfig to enable the relevant drivers.

Tested on the Tibbo LTPP3G2 board with linux-next 20260901.

Andrew Gaylard (2):
  arm: dts: sunplus: add peripheral device nodes to sp7021.dtsi
  arm: sunplus: add Tibbo LTPP3G2 board support; update defconfig

 arch/arm/boot/dts/sunplus/Makefile            |   5 +-
 .../dts/sunplus/sunplus-sp7021-ltpp3g2.dts    | 301 ++++++++++++++++++
 arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi |  48 +++
 arch/arm/configs/sp7021_defconfig             |  30 ++
 4 files changed, 381 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts

-- 
2.53.0


