Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBD1CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 04:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8oE9JQNdIr2S6AC34eXeEphVmop0Si1yVhh0HmwvbZ4=; b=uP3172njZdIcZhsQAcYee94x0W
	Zi2b0trSVW2Db0rpNtfVubJ9JQPmSGFRlmMVCqTLatHWiNiknClS7wiOJjHDgLL7F0LBdGVXakXiW
	lbwQigZPi8UuqJ1maUAHUtSzLDPbXLUsoFGvW8R8EQjACSFAZcrH3+HDsThGlCSBD5wZXSCGtyDpD
	gn7zas7Li2gcNfuw56Ws23r2Nxje7Jx8zoBGGOL/lwKGIOc4o68S7yuCb7uOAdBHnwPHqWbz12W2i
	izpqvt7GgF6qpxbHyq3KyyknLw68Dq/2myOxFaw2Qaftv8Nvaj3hsTI160sXAcJ34ci2r8sU86zcD
	Kjxxty4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEgq2-00000005Nsi-2o4O;
	Fri, 31 Oct 2025 04:34:10 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEgpz-00000005NsN-2KlF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 04:34:09 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7a226a0798cso1940219b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 21:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761885246; x=1762490046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8oE9JQNdIr2S6AC34eXeEphVmop0Si1yVhh0HmwvbZ4=;
        b=SzOazt7lNRr6d7nqw1YuPdTbF25mNaCP00MyyX8W0h5lntFv+Ds6icEhIk5TmZYyOm
         c1rWFvr4nxqxxbwMXOOelZEFo/gDVLcAvUIR/bk+4dn0hpQwN8N0C1/syGoNlizRQ3yL
         biGLzzLTB3MUSEA48r8zQrzUoFe86JFgmGqgyl4MqEb1uHezDeMo5BY4CVxdD97bFTkB
         k/sWFQPZhTSWwUOLsO3LGfTLbtwuGDbeMPLM+xqRqTQxwROBytjReWfuIl85ape/YYYL
         GaLRTai8xksvJOtHmK4y4Kphnh+aJC4tLg2TXiWyO4UG6VEm5xMGoBAgjCUuIj+bfK0o
         Nm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761885246; x=1762490046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oE9JQNdIr2S6AC34eXeEphVmop0Si1yVhh0HmwvbZ4=;
        b=KIM1jXf9sBIcwIkE0P5NWav5j72C5MAv27OE3Dz2tIMgZxbXrIXqZzBUzw3n1cfk5P
         yT6cDhoWa4mpG2gGb5+y9bmI+MZ7qlzZjxuQ+XmXtnYK89HOQXzd9BR69/hHeMrDMn3X
         QCjycvreiu5nr3KfLkfpsrjIPiq/2VtQdr/B5sNUkdGPA1MFvCvVeZW45FfVoitW8T6i
         /QFdr6WRtANaxdk3k2X/K7DxGnYqhRDreBQCr0+D3A11E0q1M8FflqeL+vMQKSVHF6NM
         GnNgTqtMtK7HOw1v1Po33x1KXQ1dXsp0jaDUNTXaGSvyo4sjqH1Fi5yvhHx1pea9jPIA
         s7KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVchQ6hmR/3/I0z3s9h/DgSEQhc6rHjLAWGdN0RIXSZOAZZubamXpks5V+bXwHyToas7oDQo9ci3JLnY+F9M2WZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwCShGWo9615wki9fHfeh+hHaRfOkkXnsKppmRROhfPXQYoATt5
	08Iz2SzYvwbbLpUV7x8UdjHKJ82Ay+0KxvAC/0QKag6QRh7Ly7d8lm6g
X-Gm-Gg: ASbGnctB3ht3EtQvMfaIrVvY2L3JFex9T6mZ29Jfl69GE1oVPvKxkfldAQC2Wp8BdbO
	A2JbVJPJnUP9TqPzStEVIhOu6xUCA+Rp/0Q4KC25p9jBrEu0czClRKtAW/159PwtVNqlXUHftFZ
	R/ClmHFlEEmuJIanS/t3rPZOIa4KQ5Mc+i5ZSWFUa098Ls8bmt4a31bkY9KgVZZrZehQlNI8LoN
	+cd9j+tA88QGuje9iVHNIUYYBhlYJU1kPznylf3SW+eHTNTy8HGJbVeEm0f6WCg2hwSWsTcmlX+
	9in1ObP5O3DmG/1uowgBrEWVjPkbYnj576Cd6b2MYmzYx3Lq630bVl5A/vOVOxjl1RqD+HRcaVl
	qU5aRTTd1hLjxAc8sp2XZrIjH3YxVnL5JU9Fxv3kVZIl+pdn4IpiaXmrky8+MMliYjQoXu5k/c5
	P7a7zqBb85zXI=
X-Google-Smtp-Source: AGHT+IFcwgVexeB6wDVdvipHJTWCcrQS3UvBXAtf/Vakf7r8dXNqGnnrZhcup7mg4kDFjYS+86zxzQ==
X-Received: by 2002:a05:6a00:92a4:b0:7a2:7157:6d95 with SMTP id d2e1a72fcca58-7a777952b44mr2476269b3a.14.1761885246480;
        Thu, 30 Oct 2025 21:34:06 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8d77930sm584989b3a.17.2025.10.30.21.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 21:34:05 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id F026E4209E4A; Fri, 31 Oct 2025 11:34:03 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] Documentation: treewide: Replace marc.info links with lore
Date: Fri, 31 Oct 2025 11:33:56 +0700
Message-ID: <20251031043358.23709-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2729; i=bagasdotme@gmail.com; h=from:subject; bh=Bpl9bS/WVMWM/ICcHkLvzN+RyuexkmOEFpCdccFpZHQ=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJks1rZT02e6zayOFOtpuJjgkzZHMcOq/a96wr4t7hntb tKXriZ1lLIwiHExyIopskxK5Gs6vctI5EL7WkeYOaxMIEMYuDgFYCLhKYwMb7YIGGWvdzjbN/uF 9OfT+X35U619r/Q23E0VnNz2Z+VCoIrj24vv6qVO/1y9XfPF3amrmCWU5cu/typvCX936UBl/Do OAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_213407_953120_7C6FE27E 
X-CRM114-Status: GOOD (  13.44  )
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

In the past, people would link to third-party mailing list archives
(like marc.info) for any kernel-related discussions. Now that there
is lore archive under kernel.org infrastructure, replace these marc
links

Note that the only remaining marc link is "Re: Memory mapping on Cirrus
EP9315" [1] since that thread is not available at lore [2].

[1]: https://marc.info/?l=linux-arm-kernel&m=110061245502000&w=2
[2]: https://lore.kernel.org/linux-arm-kernel/?q=b%3A%22Re%3A+Memory+mapping+on+Cirrus+EP9315%22

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/driver-api/usb/writing_musb_glue_layer.rst | 2 +-
 Documentation/mm/active_mm.rst                           | 2 +-
 Documentation/translations/zh_CN/mm/active_mm.rst        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/usb/writing_musb_glue_layer.rst b/Documentation/driver-api/usb/writing_musb_glue_layer.rst
index 0bb96ecdf527b4..b748b9fb1965af 100644
--- a/Documentation/driver-api/usb/writing_musb_glue_layer.rst
+++ b/Documentation/driver-api/usb/writing_musb_glue_layer.rst
@@ -709,7 +709,7 @@ Resources
 
 USB Home Page: https://www.usb.org
 
-linux-usb Mailing List Archives: https://marc.info/?l=linux-usb
+linux-usb Mailing List Archives: https://lore.kernel.org/linux-usb
 
 USB On-the-Go Basics:
 https://www.maximintegrated.com/app-notes/index.mvp/id/1822
diff --git a/Documentation/mm/active_mm.rst b/Documentation/mm/active_mm.rst
index d096fc091e2330..60d819d7d0435a 100644
--- a/Documentation/mm/active_mm.rst
+++ b/Documentation/mm/active_mm.rst
@@ -92,4 +92,4 @@ helpers, which abstract this config option.
  and register state is separate, the alpha PALcode joins the two, and you
  need to switch both together).
 
- (From http://marc.info/?l=linux-kernel&m=93337278602211&w=2)
+ (From https://lore.kernel.org/lkml/Pine.LNX.4.10.9907301410280.752-100000@penguin.transmeta.com/)
diff --git a/Documentation/translations/zh_CN/mm/active_mm.rst b/Documentation/translations/zh_CN/mm/active_mm.rst
index b3352668c4c850..9496a0bb7d0705 100644
--- a/Documentation/translations/zh_CN/mm/active_mm.rst
+++ b/Documentation/translations/zh_CN/mm/active_mm.rst
@@ -87,4 +87,4 @@ Active MM
  最丑陋的之一--不像其他架构的MM和寄存器状态是分开的，alpha的PALcode将两者
  连接起来，你需要同时切换两者）。
 
- (文档来源 http://marc.info/?l=linux-kernel&m=93337278602211&w=2)
+ (文档来源 https://lore.kernel.org/lkml/Pine.LNX.4.10.9907301410280.752-100000@penguin.transmeta.com/)

base-commit: e5e7ca66a7fc6b8073c30a048e1157b88d427980
-- 
An old man doll... just what I always wanted! - Clara


