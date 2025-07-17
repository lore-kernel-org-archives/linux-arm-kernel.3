Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CDCC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 19:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mzt9wZOnZ6+CbKPnKZeU8dqGY8Qw3egF+06TS84cda4=; b=VyoXEVTUEgoUBR
	kn4hSQBXFdTZGFpi76tL0qXlpTBv85ibcR7miOrJMlse/24fMKGEVKRFK7r61uvT6NsH8+ETHGi9w
	BjjKs8mjYWAbD4I2HCxwRQ5zSB1DRDPIuVZu/547YxeZyR7ki7+wxSFOAmGR4eKfGRoTbHapAnj+U
	gxCm6pbmrddtQM97xGdGTHA+bl3KOClqIIVX/afIEfZuvwoEB+m8jJv4/xd52vAlPIfLkqiLEfAIG
	Mdj2j/Eg8b6oILA4LjyURRqC9e7IaAXx88a5KY3VutIq19u1I1g4qjDHEurHgyDBX3kaQxaCr0Tav
	fAcjphbIF/5BrnrCwwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucU8S-0000000AzYh-1Lpp;
	Thu, 17 Jul 2025 19:19:16 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucU60-0000000AywN-1sW2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 19:16:45 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45610582d07so10701965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752779802; x=1753384602; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mzt9wZOnZ6+CbKPnKZeU8dqGY8Qw3egF+06TS84cda4=;
        b=ifwM9uM05P8PwhlmjSx9hNQ1WN1YtsFv4b8rP9FjKlk0atPYDA8ZJ1Crz/MkxGyqdE
         waYHjsdhaRKyfLqX/DW/7NKvSZWAaWqMIQzCTpWu36PjUTgnBuZV18vTEbECsQr2uhlp
         SmTmOnXz0GdCgS4ixBtp3m5bh3aCx6JAXEo7MPPlk3/WEZpHvRpm33UnwCqbUPj3d5f1
         rIzp5E+mkcXwC7IUuVVihJdaaLlQArp1NV5m8X+obYBaXCugn/r7xM1AVlVjKs9yfgr3
         gZoYuRBWjIl62ePsg3kRjSE9Il007paHNv6QsNMHHBGXX7kXs8ZGnN2az4sK4646KTY5
         i4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752779802; x=1753384602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mzt9wZOnZ6+CbKPnKZeU8dqGY8Qw3egF+06TS84cda4=;
        b=b81EpVtwoExzvpSRBz7x1Zk+1HdThroi9nnGU8z+wCYQKeqQeJdn27IZOs0Q7gXD08
         wpCjcnlFCCpFiLCfvcgxC8SYLSPD7rYyJeHFpHzEDlFSanpVTCJVWRTCo5fW3c3IIihT
         bLPEfYp5SXbd7CLp6cPxPYrXfIvU+A8uFuvRPdOboo9hck3JqvCkVGJF8+l0fwtK3rLe
         pH3LBJAPmX48jLOowdBslb0NneTWspkHZTdEeWSO+Xc6gaCDktViEpNho9lwZ1tN8PpV
         JHHIMNu7n3iwGkEJrzb9vxNouhu1hTzOUztEEImTzctgAhJns6EvR+ugNDq4fxOcqNqV
         Af9w==
X-Forwarded-Encrypted: i=1; AJvYcCU0SKuti2oBldyqOimgLMgdqFZxpOWcxJAL4iQoN9OKCTgtuOYqxFxmXqvzeO4eSIBzdihCIRFN3xLOlYZ/d75f@lists.infradead.org
X-Gm-Message-State: AOJu0YxgdRANgKZ6ZaHmHxn5wejJRopBq8o5A1Zkgw9rUJ6dpyKwQYQU
	b0PfH/5LPi5g/bunUXd5pFq+jmk9L86kXOlo6a4hKk4VugsSVNPO9VJj
X-Gm-Gg: ASbGnctEFD+SUUs8QFDgT46XvGkBqkzi168tKOt5Vs+qAOsS/vflOWghesfnRlWJLAv
	T0WzwXq56DDYsZrqbB2r/JI9F4FBnWmXSbcvaNJHT4rkVJb9eUsU1xLSSscn7ms/O+ZsvjhvLy9
	czILGrVhMpBu8O1bnk9Nym+exPjjd8EYIgTWPncPB6EeWo2r073UqzvSa5Pf56gzWmZJhPW++1E
	mDAEuJNGicjWq2oqtIO9QvzNcGEUWlqJ46oXx3dBdzdXEWEqzxu4He/4fIrbrjdBHbfGnO/IHa/
	0POL01MS+iRZhB2X318L71+vMJq0bGM5VuozWixKOw90m5reWXX3csktsZMr2kUmcbKmUBqpuXD
	663CssiDRB8xjDvLV2MxMP205Z4OEOMht
X-Google-Smtp-Source: AGHT+IFF8lsVWJTJwrDMD6i4As+eyuiIbEESQQF0qhNLx6tTwcszxJEOXDFYIrXcHilqwhBPrGxWeg==
X-Received: by 2002:a05:6000:420b:b0:3a8:6260:d321 with SMTP id ffacd0b85a97d-3b613e60143mr3320230f8f.3.1752779802135;
        Thu, 17 Jul 2025 12:16:42 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8dc22a8sm21918017f8f.34.2025.07.17.12.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 12:16:41 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: [PATCH 0/4] STi device-tree display subsystem rework
Date: Thu, 17 Jul 2025 21:15:31 +0200
Message-Id: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANNLeWgC/03M0QrCIBTG8VcZ5zrjaNNYV71H7EKd2w61OXRYM
 Xz3bBB0+f/g+20QXSAX4VJtEFyiSH4uwQ8V2FHPg2PUlQaBQmKNnMWVWHBPH+7MIDZScn1SwkI
 5LMH19NqxW1t6pLj68N7tJL7rj1H/TBIMWceN4r3Bc1Or6zBpehytn6DNOX8A7qr4j6QAAAA=
X-Change-ID: 20250401-sti-rework-b009551a362c
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1460; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=PyayYQ0JPKYC1bSL+yF6YQ9AEnmvymFEa0T+fiUNE9w=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoeUwQs4pAM5O38T3nlF8WEU7Y1ach2SghQdlSd
 adJbgagmsiJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaHlMEAAKCRDnIYpo1BLC
 tUxUEACQ1QihV0/vZF+Z/ZIMLTCNbEanzLlzjAJHu/gACUzwmyqQJhxOU2sI0NlfI4fNnrDXVXX
 3jXo+32bwmKHyRv00ls59P4a2tNtmANDSLl29KDKXRQofRMWv8Z4gadAbZyH9+vV08C5a34d7KP
 HGmgHSzq3EzRHjI3+uLXSSayuLzZlWKc8wF0XPbSLvna47gLHxqjZ9TQg9QOIyswiDsIXchnSKs
 JSJGCTSQQzbU04fuToq8JHXUSoMUHclxDppK0+SfJ/r77L4+0DWUy2bzuyf8G/ixqNragahIjBW
 YvoOvV/xGgXrdKUnt7cfP2CRRCpIcgRUx9KL0hBol/m6Xm5QuSY66guBwaNJkBCBjLnibmw/jab
 uny3szjVv6tviSINjWBqFxxIqV9lPGGjs1krT4VhA8pxmNIDvWhyRw0iz+FbyU/8nhyKkFGKzwM
 egEKm3+tFJSy5/nT/2BiC7P36ip9UyFi1s7+1lhIV3kY5ZCy6j3XDET5JyyC445WceMSPGy9drt
 PdKXf1ILK1uaMaOTREFlH5zQb8pADUj/v3A8n1c7PJPtC479R7Er/hFwGPD8VXo7lU4dALC7IGA
 oW1UaNYAKydYyRTL0a8gHxXM2jeIj12ozjm2xhrJO2uE4jZ+aav5Ou/vGzJn29QZ0zJqBylIydS
 4yPttkUKVVLkHTg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_121644_491171_A16C8CA4 
X-CRM114-Status: UNSURE (   8.55  )
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

This serie aims to rework the display-subsystem node, which was
previously included directly within the SoC node.  This was wrong
because it is an abstraction and describes how IPs behave together, not
what the hardware is.  Instead, extract display-subsystem outside of the
SoC node, and let IPs describe their connections.  Doing so helps the
readability, and eases the understanding of the hardware.

Several nodes have been renamed to stick to the generic names defined in
the device-tree specification.

This series depends on another sent a few days ago.  It is not critical
though, since not having it only triggers warnings when building
deprecated device-trees.  Please see link below.

Link: https://lore.kernel.org/lkml/20250714-sti-rework-v2-0-f4274920858b@gmail.com

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Raphael Gallais-Pou (4):
      drm/sti: check dma_set_coherent_mask return value
      drm/sti: make use of drm_of_component_probe
      ARM: dts: sti: extract display subsystem out of soc
      ARM: dts: sti: remove useless cells fields

 arch/arm/boot/dts/st/stih410.dtsi | 316 ++++++++++++++++++++++----------------
 drivers/gpu/drm/sti/sti_drv.c     |  18 +--
 2 files changed, 192 insertions(+), 142 deletions(-)
---
base-commit: b9a572f471993d3e8bf874fcb57f331d66650440
change-id: 20250401-sti-rework-b009551a362c

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>


