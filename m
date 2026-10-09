Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB22CA601F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOA4c9z5sUn9VN7fOpKn/7mWxETsDjWhelJneUehGWw=; b=1F3Y1QiA7oxHQgAhVKELhGD4v8
	Qx+vwimUoqwMRXl/jEHo64/70wzgEBr6+lgZYD9EMaFwIY69E469dmsiAm7J/Ubxhy8Vg3xV/fgDt
	fsygtunozhwZkqkZDjyl0yvoNQ3wkyT/lxwmKNbOsP7O2DAgLmbEuZQS+j8UoJdceVHuosBC4kASv
	ZBudkEZ5JZSoB80F+I4/aBbz8Gzec1oWoVp6w3YaMKB+/SZzmz4P+LsnMh9WfY5OhtnBZZJIAiWBF
	PclqTYtUxkEg10OzUiX6zBxu12sVg7pF6GvF6ecMf4440yH0e8+tEYeljaz5h8CkGlBCxFXrYhNXz
	oz57MPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLO-00000006xsa-3WU2;
	Fri, 09 Oct 2026 18:29:22 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLI-00000006xfm-3Td4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 18:29:19 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48c4be28b82so79328f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 11:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570555; x=1792175355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sOA4c9z5sUn9VN7fOpKn/7mWxETsDjWhelJneUehGWw=;
        b=XeU07Ca7xQpxTiy58uCJ8MoSU4EbnjczZLmVahazFobKbIuFfQM+MQHZddLSGbSIqo
         T3oppUTz05Fy972BFiJH6jbGlu9/pPCZtISglPahBQRb531Sh62IIi0GDROC5s+rQNj3
         Wd2RJ6nvZAeeIjY6HLhhaVZZMw+88Z5jxmfLgSpbH0f8BsCfWv/dNOqlgGRnJWeYSe03
         YJyEAFs9zHIzhTf2uhFlCVqBrkVVSr5xsFtp8lS1yd61hJbJoIXYOOngGcMhKoFfnWQ4
         H+4z8yKU/7ZilYyoXqAw/pb0RO4WIh1DfxntcMytuXhpcHhCFwy1lr+sYe0ROYBHg9c8
         ObUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570555; x=1792175355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sOA4c9z5sUn9VN7fOpKn/7mWxETsDjWhelJneUehGWw=;
        b=c6eAF7atYuDPULeAW/K6C6wKV6dZbPKPZEspxLzTAJYfsmoKtBxy5GlO6mKBxaVS4s
         ZHv0R3yNqqxvGjswqigfx/VfnjuUQLWnHjL0n8Dm4Ap8LmKZakDscKrc3+QM6YNKrZT8
         dHFRAmq3Uhgb/USvQ4Ae2Aaf377AeEoyo2UM52GJFQGLbb3XoVNIJ4b3s9ik+GRIrmAV
         YbfKEVSXpThfmhSl/V3luO2+3GkHKppRzqWzfpLoSBYSwc0GD/KuPOzQRzlOUaBrPBEl
         VTS5AwS4E/q0Ycm9rSn0rZ/vRsZV7JHWUnCG4MzA87Ylx55+kFdmlOolDfRat87+RElD
         38bw==
X-Forwarded-Encrypted: i=1; AKwUvBzFGjSMa42I2HTnbDDQgHknK/J5nJQ0+1LPtail1Z2VvdK5nHuNeyBfn5aeVVoghHITGGCv+zmgWTDwPsafasxi@lists.infradead.org
X-Gm-Message-State: AFq9FYJLpBUCcgdH986mFtH+rpiVR28s8ou/L7qxNvCM4wHQyZAdNiHE
	wyfHnq2++XyXG41IocANbrxJUwZ/knjzrUB2PlcqhlVGe5NTa+DqxBZG
X-Gm-Gg: AYBFou18yreb6fYqzbauDYgq7FT8ZJZwhnBB06h7+EIrCDi+/By+id9wFCIMSkp9rZs
	3fBg8OMA6IyDZ6+P7w9YyG33ooy6X0apctFyyGX5fjmPWGKVCkjxmvJBdIHOJ/uRlbR7XDBG+bO
	besDtMTteVTp7iWwnlAkT2YsgPPlkGAvBu6er1nLB6yAQoXYtkbYTyGDv0Mid5zLQux35JXqspq
	sZ+rXi7UdMiJB/P0UA10UXZ0pB6PdZ3wnpWOcF0mXoG5airRNKy6Kk0y/Xo9nZa6GqCVDG0ZKjp
	hu6FvVzkn3lRI4TE5lZkQNK7S87y8+cLfHszEoIQJd53n3KlGXRuZ8TOJjv9xHBZipVTvG6Y07G
	Jlzv3WOME3sxRHDGeMKAVd3uH+mLUlDKITkvYakP72gr5depY+m1pqdyHtUDpMDo82oRzoTucSa
	7FV4NSH8cFAER8F42GPvsJpb5IiE3vwII0UeWg27TmXIRmCr1UQXjVLJIVxZu3vwUZF3+2OmUkI
	jal8NGQjuPzwDbsCP9xu3GG1oxrJq15g3F76g0OXxDsje9NBi1U6fw3yBsiIgKEAI1sMM7V86Xd
	N5BIwHMjc02v80X4xA==
X-Received: by 2002:a05:6000:46db:b0:48b:e50:7152 with SMTP id ffacd0b85a97d-48dbaae21dcmr3669370f8f.28.1791570555000;
        Fri, 09 Oct 2026 11:29:15 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:14 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v18 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri,  9 Oct 2026 20:28:04 +0200
Message-ID: <20261009182836.50631-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_112916_921121_6B9DF245 
X-CRM114-Status: GOOD (  10.73  )
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 509b35b5a0e7..d8533e36941c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9759,6 +9759,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0


