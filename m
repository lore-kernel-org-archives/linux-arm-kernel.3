Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557F6C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upkUEcdxz5STfJPQ4kkmMOejVzK2A86eaQiIajui414=; b=EEBZ85mjh0HJmL88nSY6P+OdPV
	JCNJcVsqvuixuUr7M9QwDuO0QoXwqe3iGs9uDIH4NYmtcZahy/sIc6wwgD09VSl35Al/hvuXRNSvS
	EKLyn9lsHc/vLfY1vahOBeIMP6c48HuuxkSHpf5IjleD2JEsDCfGpMAkhxcngabhwxWI3prn7ZHsT
	YK03qOQzmc/3E+DsI0uI/wToiVtmuWqXJfK3aPctXoZ4T25manHF3a+6nyOUvYp+Aizt6UuB6yH2G
	TN962f/rdPF2RrY72BDaSDHWs+zeGQKgfhCmTf/aLUlDvEZclLYkB/t2Mv74P0HgiqXwS3GO7FIqP
	H7T4cNzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7X9Z-0000000EIpd-3yjE;
	Fri, 18 Sep 2026 11:53:17 +0000
Received: from out-20.mta0.migadu.com ([2001:41d0:1004:224b::14] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7X9W-0000000EIox-1lwG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:53:16 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Us9LrP9tn+cuJ23nFB72OLu50wkifpY3Zpopv4/iL6Y=;
 c=simple/simple; d=jimenezcarrero.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789732387; v=1; x=1790337187;
 b=d/f5oLl/SH336LyEBGAZxWL2G4XFl5CeATmwv/LL33SBRxdOil55kxUaJcrxiJ8lZB5xVx/2
 Ywm1zltLTipe4xxje7No+Q4L/V6dKSGS3ABQph+bQKWUQj4YBxq9dDXLCYT3SRqCkI+JalnN5+G
 5doz8fpnoerAYriWv9DA88JUqr7lmGd4Y9cgI1V/6Fvep9q7zCL3AbABd7EyRmNJpYQvGhROUiE
 KxzkFmxP22QQpFexXb5vw/3VOfjER0hRzqDjUvmGU/UObPsdk93f2OxiNOO+0OT3Glpn430On9y
 O69c622QDZtMhzEqZSSKDYqsnQH+w8UTLSCv6VULmZD7A==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4f71428dc03b4a63;
	Fri, 18 Sep 2026 11:52:57 +0000
X-Mizu-Trace-ID: 4f71428dc03b4a63
X-Migadu-Flow: FLOW_OUT
From: Juan Jimenez Carrero <juan@jimenezcarrero.com>
To: rf@opensource.cirrus.com,
	khalilst@gmail.com
Cc: khalil@rentman.nl,
	broonie@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	patches@opensource.cirrus.com,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr
Subject: Re: [PATCH v3 0/3] Fix CS35L56 amplifier on Intel LPSS SPI with broken ACPI cs-gpios
Date: Fri, 18 Sep 2026 13:52:40 +0200
Message-ID: <20260918115240.29204-1-juan@jimenezcarrero.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <a15eae4d-d533-4280-986c-5de90d5fd2e4@opensource.cirrus.com>
References: <a15eae4d-d533-4280-986c-5de90d5fd2e4@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_045315_064096_C35106CF 
X-CRM114-Status: UNSURE (   9.17  )
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

On Thu, 17 Sep 2026 14:42:18 +0100, Richard Fitzgerald wrote:
> The latest BIOS (01.06.02) is reported to fix the problem:
> https://bugzilla.kernel.org/show_bug.cgi?id=221064#c23

Thanks, Richard. Confirmed on the same machine as my earlier report:

  HP EliteBook 8 G1i 14 inch, DMI board 8D8A, SKU D75TQET#ABE
  BIOS X91 Ver. 01.05.02 -> X91 Ver. 01.06.02 (dated 07/22/2026)

I dumped the ACPI tables before and after the update. The only change
in Scope (\_SB.PC00.SPI0) is the cs-gpios property:

   "cs-gpios",
  -Package (0x01)
  +Package (0x05)
   {
  +    Zero,
  +    GSPK,
  +    Zero,
  +    Zero,
       Zero
   }

CS0 stays on the native chip select and CS1 becomes GpioIo resource 0
of GSPK, which is the same GPIO that 2/3 installs. Device (GSPK) is
unchanged between the two versions.

On 01.06.02 with an unpatched kernel (7.2.5, no out-of-tree modules,
taint 0) both amplifiers probe, the calibration is applied and the
speakers play. The "cs1 >= max 1" error is gone.

With 2/3 and 3/3 still loaded on 01.06.02, the quirk matches the DMI
entry but returns early because cs < num_chipselect, so the series
does no harm on the fixed firmware. On 01.05.02 it is still needed,
and my earlier Tested-by stands for that case.

One small detail in case there is a v4: the DMI entry's .ident says
"HP EliteBook 8 G1i 16 inch", but board 8D8A is also the 14 inch model
I tested on.

Thanks,
Juan

