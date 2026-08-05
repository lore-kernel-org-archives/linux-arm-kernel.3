Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E14CC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ep5s2RfCR1ouH4tpNMfbsvxcvHXIBQkHbYkhl2XlO8g=; b=1WVYVc/absKno7
	xmCYmzTMvXaPpBqDZ2KLuhgk6ZitxBVnHhCLGZXScrURo6Vn1DdALTWkWlCbabUWGZlrpUOxAPRLF
	najQYjcfWz93DdhjKUKm4+6howFekkTXUxe1/ei8xUmwj5+pgPKNaV5p3Gmxle3wWIUEEqzbtc1VA
	ijXpkcBLyZI89CBp3/y/HealimafWyXOY1cGjvILP2gcOQn7hJdri6SUaDSHL6XetacYliJxCU6Vx
	O3SIr8cFDjOdB7swOReDSykIx8Su3hrDH0RtN1PgwXwITXk2/cvUW0HAZgoctq7GwSmuarXHmtzu9
	EADjQM+9BoLqp+iGQinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrd8X-000000048Ig-3Qet;
	Wed, 05 Aug 2026 15:02:29 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrd8V-000000048He-1yFY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:02:28 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47fd66a094eso442622f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785942145; x=1786546945; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ep5s2RfCR1ouH4tpNMfbsvxcvHXIBQkHbYkhl2XlO8g=;
        b=dg1kDaO6ndaxc+JvpDBu3A64bfhRvtfOefoTUDgKS/9AqqfCV2WvcOYzBojF3oWSdJ
         T06+QpdUq4IbPQxdyIpfAEqIepx1FVzpSTRIGJoPm++IvWfkWjb7VgQSN9fHG7OJYU7R
         6shpYfkMYC3OmTBqrDIVUaLagOVpp7Sb0NYQdLAxHsmF+K2tqVEI+pYf2ir4sR3cd31f
         dDX7WjOBX8B5xl5uUbHilJmV0inI2JQsA/1gv+75T7UQR0Iem14Z3J3dPK1BD0MCtdAp
         1qC34ATxKLyWUhQFyQ1Iqm84mYq7dEs7zeDtA8auvrGaTyJJiQoa4TukRG4A5jDUKt+F
         O6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785942145; x=1786546945;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ep5s2RfCR1ouH4tpNMfbsvxcvHXIBQkHbYkhl2XlO8g=;
        b=KmCmun7sMTnJj2I1/AXKuoWfME4JyrT/mDNAkVpnJECuLi3sgJK8rK5OIdpWLGLhws
         WBihPGGh0LuE3yT14NfjJqWWC53QzVVGd+g4ORDQC7kEgvOQjf6x3VikwIRRQdpn5uez
         0DE5Xf5+3djI4/g0j6cXMxe9Pcy+MN9nOH7u6rHgdTI7zKXd0XnWdxdE4SG9fn0g/edM
         OXDVwuGJfDWbuMQi+3MKVlgzZfoiaVkwAJcoS+vWmWwCRLxI3tsjWQHvGEmqg8dTkveQ
         XtirwPy3We0hrYKepil8RyTZHYt4cYDV33Rn36QU1P8QI34Cfl1evv/4niJEJGymFrhz
         IfTw==
X-Gm-Message-State: AOJu0YxOjzcvUDa5G0rVQakKxE7/wHSwXy1QG1pyJiCL8LIsPpYau9ih
	xKLb6hJqCVzUKEogCmkTWWdnrzQlkh8b2vjb5PQSlx+iHFeHE+otJNosmOB0Qxr+j9b/U9SGxTV
	zY6BDmF/BYg==
X-Gm-Gg: AR+sD13b+5zggUnp8tjt6WdGcF84/vYAxaE3RguhLYoB5XA8p8fTiwfSWe3qVByoW7q
	JFPJiLGLfN1aUnwsN+jM4GA7HodHwslMldXro9A8ZopLIZVkilozWmOcUPb3zqg/wv5xyxfqCVh
	2CRPUvROUTISSMMtH2b7kpKE1822J487shxjy/jRsycuZyAOurw+eK6NdvDpzgmMVLXpgk4wNfT
	jqgtMh54KJv3wqF5cRV64Y2KlLoIsSc8IXiSMSYpbX58SryhUpp0BMN1WLbvhWAsFAqMOefL6O7
	qvuhAf5NHy2F5+MeBuT1afyYK06KETWeLLZ3id72LSE8DrHCPcsYhHRJQ7VUhczSD7ZNmLMsKK7
	2q8ENITKROZXhknSFlkGNy8CtAZSk26IjNSYBPLGgHFARuhwJFZ2RzXJI7PhBNcIrnAhv9Vc/TW
	FJ8bf8emTMLH7ThXlD2WVoHJEiF0dBvwz3Fe2Q102A3dt17DZRHz0dwo2TKmijJH9o
X-Received: by 2002:a5d:5541:0:b0:47a:b86f:3ed1 with SMTP id ffacd0b85a97d-47fec62bacamr9911458f8f.21.1785942145445;
        Wed, 05 Aug 2026 08:02:25 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23ede6sm10308695f8f.30.2026.08.05.08.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:02:24 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/3] perf: arm_spe: Add support for a 'software' discard
 mode
Date: Wed, 05 Aug 2026 16:01:50 +0100
Message-Id: <20260805-james-spe-software-discard-v1-0-0ff0e44c4c92@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF5Qc2oC/x3MQQqDQAwF0KtI1g3MiKjTq5QuwszXplCVpNiCe
 PcOXb7NO8hhCqdrc5BhV9d1qYiXhvJDlhmspZra0PZhDB0/5QVn38C+Tu+PGLioZ7HC49CnmBE
 ldYlqsBkm/f7z2/08fxEhcjRsAAAA
X-Change-ID: 20260804-james-spe-software-discard-87691ce1a949
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, 
 Al Grant <Al.Grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_080227_538966_7532B9FB 
X-CRM114-Status: GOOD (  12.68  )
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

Add a mode similar to discard mode that we get in SPE V1P2, but without
requiring hardware support. It works by allocating a single page in the
driver when opening the event so the buffer can still be programmed and
SPE enabled. The same page is mapped multiple times to make up a 4MB
buffer so the full interrupt is serviced less frequently.

Unfortunately we can't rely on userspace to do the allocation because
the existing HW discard mode came with the relaxation that an event can
be opened without mapping a buffer. Therefore adding SW discard mode
without doing the allocation in the driver would break old tools. It
will also be useful for very simple tools that only do raw
perf_event_open() calls and don't want to mess around with mmaps. Tools
also can't do the hack to present a 4MB buffer to hardware while only
being backed by a single page.

Discard mode is used to activate SPE related PMU events so that they can
be counted by the PMU, without the overhead of collecting any SPE data.
So it's likely that simple tools are using discard mode with only raw
perf_event_open() calls.

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (3):
      perf: arm_spe: Factor aux output and flags out of buffer fault handler
      perf: arm_spe: Factor HW discard mode out of arm_spe_perf_aux_output_begin()
      perf: arm_spe: Add support for a 'software' discard mode

 drivers/perf/arm_spe_pmu.c | 208 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 168 insertions(+), 40 deletions(-)
---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260804-james-spe-software-discard-87691ce1a949

Best regards,
--  
James Clark <james.clark@linaro.org>


