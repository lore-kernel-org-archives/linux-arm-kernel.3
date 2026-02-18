Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B638E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 15:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=37iDQjIpWJV9G//cF72AU0D/7XMD1Sk3hL7SaalPYgs=; b=P6oNYZju8o5eIe0lVF0RMa6+bS
	9VjkgmdcCSYWKTMZKMJZD+ZTkPD4M3SEexe2TUIK0Ec5O/NHBr+AFl3JobNjPVdLY+kg18j/ikBhE
	9+dMU05PQorSnSLkJDF0gaFONmb50vJzbEjHDq20vxg1nQ4Z2tLgcvIenL/Sb7YfsiMlbI9LYfTqA
	kYIlpvPwf4h1EVYUGy3S9/zcuEzYmvP+jce733tEVF9lMQc+tP1uebikn7hkMo6xrUjuuM5fDtBxT
	UIC1yC72WGDRzrHKlgMFQ6PwUWyNVAbop4BbKLPlb4kIRModWmhCL92TVsMw3sH+9F2OmTpm9HWOy
	0Tj7b+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsjBS-00000009zpt-48XH;
	Wed, 18 Feb 2026 15:09:46 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsjBQ-00000009zpM-2EA2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 15:09:45 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-436e87589e8so6462373f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 07:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771427382; x=1772032182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=37iDQjIpWJV9G//cF72AU0D/7XMD1Sk3hL7SaalPYgs=;
        b=cVjAkY7hWD6Lx3ANjIYQM0eaHcdwJxCyboul8JuNHpWqNHX0fIjjzituU5gbpzdKvy
         KM26nhDyE7T7BiRlrOGHG30IYEP7saJICX23zXM0ovt4JadfxYxTPgZrnzWHo0WeLoVj
         G8wQ8qXvyNVxLjIUCHFXZC6XTys3wORDPuvF1XHJ+qfyZEG7lnjcj9dd6sCsbMJD8h88
         f5SY7RtQ0uKxnsXtpFPdtyAwhFzsrIuasZ+QPI5Qz5HmV225D32rbGisG0FIg5WGQIBB
         Mw20oNdBvERVWy2R7ssWVKMYL5UktjObCIZ9M09OFWI+/qz7ZiweGkx060SnRtdBUeKo
         FcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771427382; x=1772032182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37iDQjIpWJV9G//cF72AU0D/7XMD1Sk3hL7SaalPYgs=;
        b=rdvwFo0dKxSfi0rpUOazHziJz3KsYJMLsYM98CByNkq2Pmyt23rb3Jar8EbLeEoq1/
         LLR0jlOE7peqx3SDYb1iiIMje6ahfW5vz/tSRrjoBqYS1rwfHPUpSlN/IB8od0WYvbTQ
         xBmreNdBwPLV7ujxWRoUv4td7YPTW/HgF4whkJy+el0fbBq7DKhADW6wkGakfl3Dh6i3
         eaDlLrbA8WIP/UUjgmDKJ6F/9pdtC1BjosDeJccFGOfg8fRMhATBU0vWMNdUYvLKNCOE
         x3zkZjGSuTF8USIIidYWCbbNIqIa9xSW0T8DumSZpwmJHxM80qqtRyrs6FUeXR0dNwzC
         JCrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWrSsR29MpuByQs8iPOSx2EfiMEFOoet/wCFSrWMpebONMAWvZL3Z68+GAzf0p9VRFyu5W2yah3Bunzmpa3a8h@lists.infradead.org
X-Gm-Message-State: AOJu0YzP4RPAEmpJ376kJws0XEawXOpavJMPS8ySuw2FS5VkBpopjlmd
	jlkOiOf6LmqF+ixjib9b4mkjwoA/xfw8Q3RZbo2h5cCJVp+RoSWF9hIi
X-Gm-Gg: AZuq6aIV7iO5J01ZejtFPKXAVPUgkZx4MRbDlOdRKVdVtLPaZiX8i4KWjjSffTMFdOe
	2YG1/qT3F7yvCdzfrC82I1xUFrq2XtizqHUJQ9ZT2sut/s5kdsIeRYhhQU7awVVRzfQn6GvnoEr
	CINQFKndfH+YuskXSdJbtzO1shF/zbLZYWrSN13FylccQU4kBzlOe4O3ppSVsshIfu5lhPcQyMO
	BMzRyeqwPWtayYC21mWb0hd99FitoAnQRXMokXAep44Uuakb5/uwVbO95QoDXoVXnSxiOp6qsl2
	tRtbEePcMfrU2b3wn+vtfeNtOjR2bDCdstYjVQQUtrXfBfoS4YP3tEAECFz7ou8KwYQf35QHMY7
	sE3kwMfLgV46vpCGcrKAmsBmAdWQX5yLOygRvdVPaiXqdpjFO6nMVWvt+zfd4t4Qa9+/3RBMfXa
	g8L7nMSLjfQzUALhw3FN7E5O6iWqeMBUnOPwW/ajb+OX3suKgAx02wuFg7y73v5FzWdfOx8nyMY
	a+qh01Ca9ixDbIm9wLP+6elNITTFPPyHr77
X-Received: by 2002:a05:6000:22c1:b0:436:18d3:25 with SMTP id ffacd0b85a97d-437978c99d8mr31041272f8f.10.1771427381872;
        Wed, 18 Feb 2026 07:09:41 -0800 (PST)
Received: from eichest-laptop.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac7d91sm44333116f8f.26.2026.02.18.07.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:09:41 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	stefan.eichenberger@toradex.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] i2c: imx: fix i2c issues when reading messages
Date: Wed, 18 Feb 2026 16:08:48 +0100
Message-ID: <20260218150940.131354-1-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_070944_945831_E33F9AE1 
X-CRM114-Status: GOOD (  12.29  )
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

This patch series fixes two issues with the imx i2c driver when reading
messages. 

The first issue is that after a repeated start the bus is still busy. If
the driver polls for that bus busy bit, the driver will timeout and fail
to read.

The second issue is that after the last message the driver should not
immediately read the data from the data register or an additional clock
will be generated. This can cause devices that react to that clock to
misbehave which will also lead to a timeout.

Stefan Eichenberger (2):
  i2c: imx: fix i2c issue when reading multiple messages
  i2c: imx: ensure no clock is generated after last read

 drivers/i2c/busses/i2c-imx.c | 51 ++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 19 deletions(-)

-- 
2.51.0


