Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F62EC02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 12:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i/Ub09OUl9RsJ71owNWlOANuCEZ1Ov31/V75zShlIM0=; b=eKo0JZ/rJGroKySN4TSezencVk
	+qRjMY8KoK8/e+jWQqs1blFF8A+/UwLo+REvg8EIiqIIuq8ZSeo7vWdOsihztYTTtcEJrpDxOBItt
	vkucSC166PDOB6qr0KgrDqpQKVnkZP1vMFNLiN03yioan1Jz4WySZvESIzMBWVLQJHlAXmHlsbIYD
	8oG9g04wPIQBChYZBrYx9XP+9Ttpp6VNrJMhe9jT8NvBGeYU1cD7Z2TJmVGOo0SerdTEhrHDDuJRZ
	wEwtbdMllXpFYRJCO4Tfnzw2jUhsputACHOpwYoYXpxptsTCLSfkcNHFszosdsI1G6ViOIO7+fHij
	J+i6oNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYlu8-00000000I5F-3ktv;
	Fri, 17 Jan 2025 12:56:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYlsr-00000000Hx7-1smz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 12:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737118530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i/Ub09OUl9RsJ71owNWlOANuCEZ1Ov31/V75zShlIM0=;
	b=HzcHXJ7ia2pFLLIZjRNnanIFkL4dplrrWj7ILU8l7PxDOlAVPF29hBaPVDt6HpjYPzfAbH
	p/z9YJNjqhC/IXxY6CJgiaTTE4FOgASNI2nx7UbfE0c4c6wwqQjlvKb6hML2m/HGO7jzCv
	womxmmmkUS/2SKJwbSxD4BLmJ3/+Qc4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-V0TyX9tvOWGZacVbdo9Cxg-1; Fri, 17 Jan 2025 07:55:29 -0500
X-MC-Unique: V0TyX9tvOWGZacVbdo9Cxg-1
X-Mimecast-MFC-AGG-ID: V0TyX9tvOWGZacVbdo9Cxg
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46791423fc9so42636801cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 04:55:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737118529; x=1737723329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/Ub09OUl9RsJ71owNWlOANuCEZ1Ov31/V75zShlIM0=;
        b=O/T1bTzoAEw0OUtYB+pb5OdHkd+Tr2fz/J8jO/KaXVhFf3lzvjLsGru3dI3lQMRQZb
         SN8C39zMoHes6InbBJroj/ywe+nw48ebYuS58+3BTQEf3RLTkzHuckL5c57XCvbsmcsf
         PPhoNugeWBvGgFZVuu57wEQile6h9HWCu4NBEbAmU23CKLif3vC9tZ9s2rmDRJe2AmfD
         HosyQO205jY3Urris1zMmK6+6PEiSWCdF1MFAJlzPZguYqs66Qot7K6oAe1lO/QAnnDX
         buVQFuHBP78r8JSOvg9JvW4yeHkZxZiPg4B3X9yLNXNtIAX3WegftgP6PDBAzFsWbgmt
         dtqw==
X-Forwarded-Encrypted: i=1; AJvYcCWQSt05Kki0e1elW6c36CKAFTSPJrzVJk144daQ72CjnC3HX3JO760pHE+m6e230pFFNZC6MUBWQosyeUaZV/z1@lists.infradead.org
X-Gm-Message-State: AOJu0YycgkDIELdWMpS22vK1vuyN/CkqdgHFMkjAW2yxrjtqe8z06s0t
	oAupyRRHBT354VcAHAniTh+jDX8lbkmVis4wryvr+n+PQMUhKE3wsXBkYgSUU6Vts0dsq+tpRVh
	aLat7SCpRiMhDnWod4G+QHfFE93hySuNEk6b8j+0P+J4xaDDgbLtaRL/rl9JIejPDIgVKQkIj
X-Gm-Gg: ASbGncsz6dZnxPDHX3YVP8PjlXAbJDFNDGzO8L/pFl3CsxmSeKh+kd/vG19BFK4+3pU
	hbd1i8J8FvEmXqGaV/NMzeCyMUIy/NxhsQQktGaM4KUsRc/HyQ08TAYGMcm9TohR45wVpsdj+PG
	vwGSjPcHnggokgokbJ88ejuIV8wAEuOSMQjyUWuAksIu76B1pjF+VO3SxL8CAKhpTER36t5peiZ
	AZ2Mqu0ub0T24VgfNyRW+N74XwmDJvnCTvN9hzxYg5YJ75a939pKDvcJrAUHin2rciRBvlnSY7B
	pysvO5cYeVZ1O14rjOVdumE=
X-Received: by 2002:a05:6214:3197:b0:6d8:8a01:64e2 with SMTP id 6a1803df08f44-6e1b21e2e0emr39493956d6.43.1737118528989;
        Fri, 17 Jan 2025 04:55:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx3VOtr4krB36MByyqD5emK2TbJbOECiK3nFAsHVkyKtYlRN7uMRhrwZIBRHacmF4EwSlKuw==
X-Received: by 2002:a05:6214:3197:b0:6d8:8a01:64e2 with SMTP id 6a1803df08f44-6e1b21e2e0emr39493606d6.43.1737118528701;
        Fri, 17 Jan 2025 04:55:28 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([66.187.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc22d3bsm11032406d6.55.2025.01.17.04.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 04:55:28 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] arm64: Kconfig: Remove selecting replaced HAVE_FUNCTION_GRAPH_RETVAL
Date: Fri, 17 Jan 2025 07:55:22 -0500
Message-ID: <20250117125522.99071-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oL4fXNA4RdKO39uIwQ2DPpULq9zyecQwDcV6uKczPus_1737118529
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_045533_561285_F701D360 
X-CRM114-Status: GOOD (  11.67  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs")
replaces the config HAVE_FUNCTION_GRAPH_RETVAL with the config
HAVE_FUNCTION_GRAPH_FREGS, and it replaces all the select commands in the
various architecture Kconfig files. In the arm64 architecture, the commit
adds the 'select HAVE_FUNCTION_GRAPH_FREGS', but misses to remove the
'select HAVE_FUNCTION_GRAPH_RETVAL', i.e., the select on the replaced
config.

Remove selecting the replaced config. No functional change, just cleanup.

Fixes: a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/arm64/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fcdd0ed3eca8..940343beb3d4 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -225,7 +225,6 @@ config ARM64
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_FREGS
 	select HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_GRAPH_RETVAL
 	select HAVE_GCC_PLUGINS
 	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && \
 		HW_PERF_EVENTS && HAVE_PERF_EVENTS_NMI
-- 
2.47.1


