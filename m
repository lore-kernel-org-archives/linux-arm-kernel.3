Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73612CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 17:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BByjwH6DP+Z4+u9FvWdxBfSB14chnUdtzQgKngoILck=; b=d3QuzM9OmzHZZYasb7cyfJJrdx
	agTJQmJzQVsjZze3rVrcItHGsiYYIFvhjMDMfynZBYw9HdO/GbdbTSG/vjuQOspOY6PIafez7ZId7
	EA5+EroPq4HLiG0zzhtpTXMEAGzrPOWT3/kaj7m8m0lJ2nmqHlq0JpaFBgm0h3akZHdHsX89x7mn2
	4izm0w5Djok9IyWRBBQVNJhmSX7Eo0Wbb72hyjUx0bgWEnIJGEZnqMNl9o9r8BwH6sZ8gAvyqAUA0
	2suzx/VHuFi95iuuUx2o7zi6Dg1MSkkOwjjPtBpys3cPNqEK7g+IlrpsianxIF+msJAJtfzOQgzlJ
	zjDKPMuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL33c-0000000GXop-2q8N;
	Mon, 17 Nov 2025 17:30:28 +0000
Received: from mail-pf1-f171.google.com ([209.85.210.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL33a-0000000GXoL-13gL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:30:27 +0000
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7ba49f92362so3366435b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 09:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763400625; x=1764005425; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BByjwH6DP+Z4+u9FvWdxBfSB14chnUdtzQgKngoILck=;
        b=Q27Jb+Az1ZsVeHoKPHb6q5qMMrGbgZg8zRwGC3FJ28Mn/+CN0xMaQ0wMG9w+05NQbT
         VDAdWaw5h/yPNac0neyaGetK6bOSLIoRuv/63RIxmdwzD96tQk3cOIuNm2GpRkx/Wtec
         L3UMowH9w2JbWs103Kc9fhsLAVdXa0Hp1eVWhYh3V2aKZmhK3bgCpbp9sfTMIBe9OBnS
         1m+2YvgsIEfUQNf9tDsC6kw51Pi+tAhZPQiLx/ro2etdim8hnIL3Ss/gCQcRnJQHY72X
         PbmzmE3X/DMWYVUyJAXtHgnN65NVISxHP5tI/6IgrB7UKusdZtlnfvOwgxF0RDTWxRQj
         eLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400625; x=1764005425;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BByjwH6DP+Z4+u9FvWdxBfSB14chnUdtzQgKngoILck=;
        b=e3k9r9M1MTkrx/ZgAl9IQzzrrzWlmswIdhrrrepeA+w8GExCklM7//5uBwZLnPHPov
         2TqaZha3g55VXPNWKtt2up3rjs9zUkUYsA2M44EIB7w1o8JbLbcxwIdVonMaRSEHi7Ew
         cuTJfgH8ISWVpS0e/HUzCv3zaQYRn0TsAqwD2JIFYkToFiGX9wNec5o7B7pPXokiFWDU
         ahKRg83jogWjH5KBdsjYuwtY0/twN+FdDcnLQW12786nhrK6XsTDJ14O6etqg5Iro9nb
         06msGCFK3VxEEGc0vdGoPuzCxY/oghL92kIRh9Adrm0ij103MM15dYQlLV8gFZfCDXuB
         Lhdg==
X-Forwarded-Encrypted: i=1; AJvYcCWAt9Zbkp9IwfGLKcLQIWsgK9oLKxyDCZxhp/6L7QuqqUBA8jK/WjZ+i2r/F4csIG/Ue+cfMF5rtdgyffkB0USg@lists.infradead.org
X-Gm-Message-State: AOJu0YwOlypYbxr9IcZqshSoRXZhmVvaotoVlCd1skTXyCtVKsZK7xLp
	c55jcrbgAOe53VtVCom07/7X7a8sA3oVEK2kiL7e+EFq8dFBkEfdIUEGCJWEht/A8oE1AOlnrWQ
	NhyD1mrs=
X-Gm-Gg: ASbGncs26UbdvZbWDnqu8pOzou9uvq/0EPC5S0m0qVlzBpyGk3iLciiuJDKQsoY3Jxn
	oV57h3jDvsowvSmesUdrd3ZyNVOzc953AdQF2x2Svq1fTnkpr832P/i+0X+XtWa0dCi+RvwmWJA
	f1vIDqX9Fmln8Ls1HjW7LY1guGDBW969rgF/8ITlWCEc75IAo84JE8HxzftkuexUR9sF4msmuqY
	A9bZRfJdNmHPkqXORtq1cDDXAy443uvtcWu8uTzh0tg7tYEyaWZfWwoFOgvIeSSc5MdzRlGwyH4
	LkHgCsHt5ejAtgfGmZ1y/JYCIN4RQdngba7Rj9UyAwQZh4Q1PwXFZjazgYIfkfsZqUgnK4Vdas1
	Bx/6/LwEHOxnUzoZoycPL6+pFNOeWdx717DmY3W+RnXkQXbXVqVAQJnAkXzpAVzG0xhf6m1Hq5R
	k2pU2y/7jQSyjhXk/cuLY=
X-Google-Smtp-Source: AGHT+IHbbc4k5mrkfMylyT8qgfnNnq3tN3oQVQf2oywmj0nq47cgWECuGlPIaeZHCeK9mw/C6man6A==
X-Received: by 2002:a05:6a20:12c6:b0:35d:6b4e:91f9 with SMTP id adf61e73a8af0-361171ca5b7mr161369637.24.1763400623631;
        Mon, 17 Nov 2025 09:30:23 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36f61bea9sm12609123a12.14.2025.11.17.09.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:30:22 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc/maintainers: OMAP updates for v6.19
Date: Mon, 17 Nov 2025 09:30:22 -0800
Message-ID: <7hqztwk1n5.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_093026_291096_7F4A927B 
X-CRM114-Status: UNSURE (   6.07  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/maintainers-signed

for you to fetch changes up to 517d066dc080fc297f1ab5e8c6fda7c59d48ef8d:

  MAINTAINERS: Add entry for TQ-Systems AM335 device trees (2025-11-17 08:53:39 -0800)

----------------------------------------------------------------
MAINTAINERS: Add entry for TQ-Systems AM335 device trees

----------------------------------------------------------------
Alexander Stein (1):
      MAINTAINERS: Add entry for TQ-Systems AM335 device trees

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

