Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13010C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=; b=X1fB9HkxodUDhcmRVlAv3yCW2N
	njwI6X4lKlozR5DCwONd6sOVN2kzcY1MbfY1ycK7RE7Q5P8irUbTJONptCafMRd0caud6hejBSDRj
	B1EdB4te7rreVldaBF+PX5sS6AW3vjZTsghKu+epsltKuTW9+yQvNtJ1qDF4NMcg657p1qIesCM7c
	fLFOo1NKkFYWEUZslhB5pi2DuFMoo5SucWe2QaJuOUFPg2nDNyCGyehTYQAktTHed1i9ImcunWyx3
	wY86ccNxv02oZQpmQP5dsuOJuTe7JuPCS8wiyfmftyRKsqs0FVnvoZ1sFENDQvTswwtTUYiuPeXi4
	Rk4/dzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKOb-0000000868Y-2YhS;
	Fri, 07 Aug 2026 13:13:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKOA-000000085fP-1fam
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 13:13:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so17773265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 06:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108409; x=1786713209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=Zfgjb8sdpyDNQ2Q+qnKaitcEz24c8ZBSknMDYMfj4Sv6+EdFx1+Pb5YOZoJTfN1c+i
         Uq6yXQfhKZkT1y4EpDlKbDukxpOfQ98ftBskbVpTK4kwvWQHjTzSru49HjbNb9E8Pi+v
         9aHTuX+04G7fll5CDXdmmpFJDw1UKPWGQjoBXJ0x93u0pWaa6OAFbIPMc6WnfH3WcY0N
         FiDqeduDAZyG6ZmUIQ6ISHVz70iSRhP85NvT6XzNw0fMrVrEVz8QBxLzVs3duhzWIjg6
         /LzRrkNit+MuJSk9HzDe6TUlm72Q7qNwyAZiWR8Cm7SEldizD8Vniy2+5Zqc2bj9wxYS
         bt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108409; x=1786713209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=sasG9uABz30OZOtxm4BgRfchieJ4faHw8LqotQJrwjL1WJs9gc9JLO9BAfaFkaa9VJ
         NXQcerbltX+LTPSkhcM9HLt26fLwdYh82wriA4BU3IhmEP6LqhVI8KEkZ52NwFsA7U9V
         0q987xOZMMJPyc67tNqWErsv2oylfrVcpxhczLGeTsPMLT70mt6TDdFIe5AIshEJ9Csx
         wXDPXGVwRcvzVep6dRulmAFTI1/mzYp+BJ4W7LlH4kK6oZlHUwjwFJdTFjL2QchsJ2kq
         Uk4Wrzhj7sLe2z+iuT3H3BelbNWtUHT16FfmXzv6quVsBD/uvRag0qnv3HBgydH52t4z
         kElA==
X-Forwarded-Encrypted: i=1; AHgh+RpEAcarzlQTFtAtmRRnrcvDhADoO+Y43+n/A2WcIWv+gsgepLseyTNDRt0wGZYCGr4fi+fQ8xO1w0qN6+nwa0vb@lists.infradead.org
X-Gm-Message-State: AOJu0YxoBldaNObkpKGhpVjyW9LrZsEnHzLkF3nIE+H70kwfCCTeuy2O
	DeqXtCE3pdKcVv5LdW2iA8TTxHn7m4Tk3gpN4WYdAs75kCE9vy9tE/m2
X-Gm-Gg: AR+sD139lY+au9xHPndG9A4Dh53BGI71BBa25O6V7cuYlnhIpggUjFmBx95b0ZNRT9e
	ZXEY8J53R1KMXHCFZuwSl/M2CEBYLWB7eFg0pIlGpf0CwpR8qXZHM6Xx+PWk/U8xC25pD/oTebB
	4yEuylR32vNgwOfGcMNgvosQI8cmAU4xw55oDZ2Om9kTqfvUodUwhMYi1cMpO1TLjOJkThQleTW
	mNAMrdTmtqU5des+7My6PZlATS+J8BIhHI0ODwrYDCQ5RA3KjR+u1Zd+ann+l0W7aLMKN6ZtI35
	LMCq8Ygp3TaUJXTLpGw8eK6/+1WMAEjFNCLYMW+iYH90YRBQA4cA16sbwLOYLgBvXWr10L9FgET
	b0Rd0ccID8dS1wJnnQWbs7E7dkclcxAj/oxo+QWoWsehxLr5NR4/XYF7KqivIF72hAqjsdIgEQE
	6sq13n8SqAqVESj5zTV9znKl7ub4lFT0Tlv0w+bV0qIlzYDUUeFByaMYJIduNieEWXvsypuFmaA
	s13OQGOrMQQcOYQkqFMUTelhTPZcE9HVn328kHQom/D6ci5pz/RhQ==
X-Received: by 2002:a05:600c:46cc:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-4995e085347mr52863935e9.6.1786108408434;
        Fri, 07 Aug 2026 06:13:28 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
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
	llvm@lists.linux.dev
Subject: [PATCH net-next v11 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri,  7 Aug 2026 15:12:50 +0200
Message-ID: <20260807131301.192060-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_061331_511068_FD752635 
X-CRM114-Status: GOOD (  10.33  )
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
index 08e43bc09735..e3ded0e4a115 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9688,6 +9688,15 @@ F:	include/uapi/linux/if_bridge.h
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
2.53.0


