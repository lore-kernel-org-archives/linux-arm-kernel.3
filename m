Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD16C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8tbSeZMHtNCZXJWreRbrqTxYE7/dISAs2k09LBmNzrM=; b=APWpGu9iqVm7XuxdaDz5o4o0X1
	5/Rl4G64m+oxTQO+uoGSODb7dovejJ5L+QuYX1wZxRBx8p3U8LtRCcpM+z3T1JWXbbF/0C0FLUnx6
	frzaCC8JGvN29RZbSOEGCrV18K24JEOODRB9eHgBoJpVh6og7SxmZkDYrsU81PVyL2IMjcEev1zAF
	wfKUN17TXS601F/0Z6BcT2CSNV6r9UzKmaYVjgCn2hxN3shP21+1flHzXjFAw0A9HOjF91LZ0i3yW
	GNtT1XXAM3jxmJCwwooRo6IzxRDVoRC7xUg3NtcfMZjcWqyc6lWRjTTKMuHeVcqlSwsJADst0iVcG
	y2Ndd98w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnti-0000000ENzn-0eO6;
	Thu, 12 Jun 2025 19:47:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPn0j-0000000E9In-3mSr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 18:50:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4531e146a24so8987925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 11:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749754248; x=1750359048; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8tbSeZMHtNCZXJWreRbrqTxYE7/dISAs2k09LBmNzrM=;
        b=NyYaOlxju8VOf6cw5dAPC0SqnYSPDJspzupkWsGjeip6juWziAqcAt8hnYLTh13Tit
         +y3DM7nOi595DuxZrW5//4caFOgk7PvZa8RNcrTkEIdHPe7h1JocGKpXRjzohUhGLuyz
         31qN51O7cmNRl888d5hOECEW+4C4Uo+GHE9N70rcSIZKHWM4zjtND1XDPxShM514xpSh
         U2KPP3BfRdK5jVj6Q1avOxzV6bkp17j+Jz5RpXpnna+eh2bdr4z3p7v5vOA76T8YJD0s
         skgA0hVNSVN3S7nJRQ25kQlB1Cuq2iGD2UAEq5KpWbw6OgmMBtZxmO7GObBkrQegzeQR
         zGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754248; x=1750359048;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8tbSeZMHtNCZXJWreRbrqTxYE7/dISAs2k09LBmNzrM=;
        b=i9yEfM4bZQg1A9WXmycgszbAKE/3EpJVoISs+D4Oc8YT2eKD51uXzpMmrYc4WwQitx
         VDvaqAetpavK5MncAHiyn4fo5aUbNdEknzVl9gBCB3oJ5jWegbgtiEPhBzn6e5gI3YR9
         NDOrCaWT6Pjq+Lj214+K6pN7TmRmhwi7mJuc0PqOhBTvB3c2FLCB3EcIL2LPiuZPOcqa
         NoJh1ieXRE5/qHYw/sKve0zgt2Jqdbx5qSna6lvouVpwojvWJxEalluHBQ2pHaP2UzZp
         dbvCUFl+3o7qMbKVUn0qhtV/gBkxEPXy141t3tx2VZ/au0rKTq6pwpoVRis3Jk+JCSRF
         U5zA==
X-Forwarded-Encrypted: i=1; AJvYcCXmjlyuY+FfS0T2ywwB2TetzBLC3nDAz0Jli3mztoBEO9iKrbqHlFAMMGTTo0Azc4psCTP2JRAvimRUkz2fRmCp@lists.infradead.org
X-Gm-Message-State: AOJu0YxYYS9e4i9ySscXDtSGcdETbaLL9eMl6m4gz4RrDg04fKzeIYqc
	G70CvUlIfqzGI1qMIN0S2fGrpfXAQ4D+iJzRfcG3xQ6oDuHdMh3pniSP9TscTCvSkbw=
X-Gm-Gg: ASbGncsuCU3kvjvWWBfWv/ir0gKLqJmOldXDw4dsfAk9DfC3ULDN22FLflvf2GtrUrS
	KV7s389keqZBPiFn5OHex0T+E3f64ixk2hxKTS1S/ueVr1rhE/1ttu57K7PKZx48gBq8tpSEW6x
	jqCp7/M4/pOVCtugMCzmYHzNm70K49gmmsVmqZn0WgvKct1883L1MpJnkD9UtTbu7pZ1GcXplWD
	nULVQMWY+eZxEgiWqzZlyIBGuQb/XjSb55Iv4wmj+F5Us1pkwfwVPU9UXqk788vqTL/6g1zOVHH
	j1EUCbJQU1f9NHUVvCXjoAM9FfuzTUPq212U3qsK4Ni2sR3buHv15e/HeFQ5mkiRnRE=
X-Google-Smtp-Source: AGHT+IFFK9l+yfY1kr4NnMO37BPPvCq/YrWFhg/vLvoWZsXd9u+zkfYJb5d1B0c7bwKtakecyoBgfg==
X-Received: by 2002:a05:600c:1d22:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-45334b0246emr2257445e9.10.1749754247699;
        Thu, 12 Jun 2025 11:50:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4532e253f64sm28578855e9.27.2025.06.12.11.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:50:47 -0700 (PDT)
Date: Thu, 12 Jun 2025 21:50:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	s32@nxp.com, linaro-s32@linaro.org,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH 0/3 v2] usb: chipidea: Add support for s32g2 and s32g3
Message-ID: <cover.1749747898.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_115049_959411_DBDFB12F 
X-CRM114-Status: GOOD (  10.37  )
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

This patchset adds support for the s32g2 and s32g3 chips.

The changes since v1:
* Put the device tree lines in alphabetical order.
* Add imx@lists.linux.dev to the CC list.
* Use power_lost_check() instead of creating a new REINIT_DURING_RESUME
  flag.
* Change the Copyright date.
* Leave the .compatible = "nxp,s32g3-usb" out of the ci_hdrc_imx.c
  driver because people can just specify both in the devicetree
  since they are compatible.

Ghennadi Procopciuc (3):
  dt-bindings: usb: Add compatible strings for s32g2/s32g3
  usb: chipidea: s32g: Add usb support for s32g2
  usb: chipidea: s32g: Add usb support for s32g3

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  2 +
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  |  2 +
 drivers/usb/chipidea/ci_hdrc_imx.c            |  6 ++
 drivers/usb/chipidea/usbmisc_imx.c            | 89 +++++++++++++++++++
 4 files changed, 99 insertions(+)

-- 
2.47.2


