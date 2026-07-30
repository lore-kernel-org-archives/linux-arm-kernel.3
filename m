Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FC8C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 00:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=amG5+bslRdnIMjojUGahI0L8Zbj6b4FQtBhaxO9WyM8=; b=OUQ2WkIktcxO8P9S9TFWcuOQEC
	pEOvs0Sq/e9Hmevbb64BKD88znutjBW4R3nv2L2cmX80lxFS4hpbinPdN8OPPnyD+w2MUL2l5ot5O
	tB6Ov+O345FmYwYPR82lMRT9ztbbEK4gKxrnbEnVYhITXUJrI8QFogdoLRhmjYhqFC3+lH2t337BX
	yWw/hLHnNxh07iJ2gfLPA8XtQdGR72d3brXEfDf162c/TQ74zV/ScMOyv+hbONrE5hG6xAq1YqBFw
	EiHXgKSwMt9XD3H5RbOKScUy/vTSq3K2xWj170TmvBbZh2/ZD8bdMrOql/At7PT4mIwcXrplG0nL+
	3n4AAERg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpExE-00000009C6Y-1mCI;
	Thu, 30 Jul 2026 00:48:56 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpExA-00000009C69-12oA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 00:48:54 +0000
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e6c4a867cso118961185a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 17:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785372530; x=1785977330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amG5+bslRdnIMjojUGahI0L8Zbj6b4FQtBhaxO9WyM8=;
        b=iXMWOFNj/rqqyf75LMVfX7uG4tgDHSgjCq5febtuVnYPl8GbAhUz5suq1pntCKrzx2
         um77RGrd/3oC/XaGVz1CvpGpsTQSo6Pt0VkEugGm3KykX+rJRtw19+d8UgEvRtOf1Jh+
         w6xs2b7M//guz/KMEJOA7dkuewWOFoFl6RBE6sruYSpYnTb1nfjcotW3VybYkvWIfeEP
         BG8Dn5FX+sSqBxjxC07oxccnA1Gyn7knUTfzn5AGLgaUEOUd3pjE1FesZHxO61EaNjFK
         Mu+xlqqlOgq/gF+qw1GDBisuC07GlGyxDn0dbJnnXydgdSTrE2N28xAhKoq7l71UFj0W
         KyDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNEQPx66NRQycR/Gy65aRQc6ZWTN+6neHHWQKJOv7G1mjqcklFQ/knwf7hw6sjDSy12rEU7/QZzRQoKYvDnATG@lists.infradead.org
X-Gm-Message-State: AOJu0YzcGlmv7uL441j/XUDmah3mb35Ck/JOcm4XgifsXzVaHCyB94/K
	Oy0WDG1JVn9p0uVLjRRifGa1QktG39xfQryCHfm9INxOigEh+hFFSMRp
X-Gm-Gg: AR+sD115MpByG1mG3uMpz24Go7rpj/o8m2eTGxyNObW439NQTrVBYQ0FUIVtzCBbVH6
	fw791f/G5mJ18G/D7AVHBixAUqNnYpVHyWJvntE3XhBhEZJ7SsvoXzzxI1Xz3fDGcXeeTh0RvNO
	cRnRSJX04xSWSJsHYklRiw6kSgF9jHcjWoRXuvRSC+wJGtOpD0/ybpi602lkKM7905vgCrHR6jL
	WTtMdmpntqWX89sJTGb6dn6EFG9rJh5xLukwN87pUIGor7Q2HrEc00GjLp6OKqftv9DxoMJIZFT
	buKx1PyuVexUMi8H4oAEtJOmnZHkp0MQmoBUXF1lRzv5rLyMU9w+nV0hRAk92DvT9KmO8DRuQ8G
	sBX9OwO2fHW+cJ7pUz+BBwbLeib6eW9/r6IYWsob3aI+5P3Jf7Ns/Kw4aj96v+zL2LkeTrrg/AM
	/CWSc+Q3nf6TYpQLqz9xQvFVxFA+q5c5GC0SKnBXLmnsp7VXN1UCpOqtW9WKxQaPvpsN1Nn8PEL
	dvhdAT4mf3Fz8VIzrB9NQsk/k7O4FnaugYglgARQ93oWMxdT6xD/uupj74VwGhclVUdTRGZ725A
	Ut5IfoWXpMH/Mfo/+g4bdbc0mQ==
X-Received: by 2002:a05:620a:a40b:10b0:928:f440:2dc7 with SMTP id af79cd13be357-93485fd24edmr41612585a.35.1785372530378;
        Wed, 29 Jul 2026 17:48:50 -0700 (PDT)
Received: from Skuld-Framework.tail03774.ts.net ([32.221.37.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d3225b17sm290329985a.8.2026.07.29.17.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 17:48:49 -0700 (PDT)
From: Neal Gompa <neal@gompa.dev>
To: Danilo Krummrich <dakr@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>
Cc: asahi@lists.linux.dev,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Sven Peter <sven@svenpeter.dev>,
	Janne Grunau <j@jannau.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH] firmware_loader: Add /lib/firmware/vendor paths for Apple ARM platforms
Date: Wed, 29 Jul 2026 20:42:58 -0400
Message-ID: <20260730004759.3089449-1-neal@gompa.dev>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_174852_293983_BC849897 
X-CRM114-Status: GOOD (  13.31  )
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

On Apple ARM machines (branded Apple Silicon Macs), there is
non-redistributable firmware provided in macOS that is required
for Linux to leverage the hardware to run properly.

The firmware covers Wi-Fi+BT support, USB, hardware ISP, the touchbar
touchscreen, and the trackpad.

In order to ensure this firmware can be installed without messing
with firmware provided by linux-firmware and other packages that
put things in the tree, the empty "vendor" subdirectory was created
to serve this purpose. This directory is used by the asahi dracut
module as part of the Asahi Linux installation process to transfer
firmware from macOS to the newly installed Linux system.

This is based on the patch originally written by Hector Martin
for Asahi Linux.

Link: https://asahilinux.org/docs/platform/introduction/
Signed-off-by: Neal Gompa <neal@gompa.dev>
---
 Documentation/driver-api/firmware/fw_search_path.rst | 2 ++
 drivers/base/firmware_loader/main.c                  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/driver-api/firmware/fw_search_path.rst b/Documentation/driver-api/firmware/fw_search_path.rst
index d7cb1e8f0076..ddd945a47fed 100644
--- a/Documentation/driver-api/firmware/fw_search_path.rst
+++ b/Documentation/driver-api/firmware/fw_search_path.rst
@@ -6,6 +6,8 @@ The following search paths are used to look for firmware on your
 root filesystem.
 
 * fw_path_para - module parameter - default is empty so this is ignored
+* /lib/firmware/vendor/UTS_RELEASE/
+* /lib/firmware/vendor/
 * /lib/firmware/updates/UTS_RELEASE/
 * /lib/firmware/updates/
 * /lib/firmware/UTS_RELEASE/
diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index 24213a0ea831..1acc5842fb24 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -471,6 +471,8 @@ static int fw_decompress_xz(struct device *dev, struct fw_priv *fw_priv,
 static char fw_path_para[256];
 static const char * const fw_path[] = {
 	fw_path_para,
+	"/lib/firmware/vendor/" UTS_RELEASE,
+	"/lib/firmware/vendor",
 	"/lib/firmware/updates/" UTS_RELEASE,
 	"/lib/firmware/updates",
 	"/lib/firmware/" UTS_RELEASE,
-- 
2.55.0


