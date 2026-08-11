Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7A1C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 19:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeGshA0Vgo+UzbU0fiiao63/SMTHgTeOeOGAfbCNRM8=; b=XalXGvV+5eclOrpD4lxk2rNYaF
	dvtIqQAAg2q48i158RDxVXIiR1AdjJARoGo+JaAj27W1cKwMIKI0YUR7bXSzZM7wsED2lwuygL+NO
	c+9tf0JI/7fBw28vfrT+X/p2PSlST5MJiqgEjECBztfonNAtXe/fX73biQZl8xFNMq4YxBExI3A/d
	TLhQG/m1788Q40RbOLqlWHOuETOY718RlvS2CiUFnYQPLIk+vI39KRMLAIzSHUmJAnnAOB9csV/kQ
	e7sB+y2E+s0NwU2sljzXgTyyWpSMJ354nVEIsom/hoK5DRd0tIc+Cya6fOO6T8hMrpC23O/I0qcJ3
	T2RKvS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wts4T-0000000EpZv-2N36;
	Tue, 11 Aug 2026 19:23:33 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wts4R-0000000EpZ1-1YkZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 19:23:32 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c15eb4015e7so9459466b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 12:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786476209; x=1787081009; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BeGshA0Vgo+UzbU0fiiao63/SMTHgTeOeOGAfbCNRM8=;
        b=L5fXKNV13wIwUXnY540gk1x7QqdlAyOCeuDCP6Yu7kp5bmgHhGl4WVNSA1Gco8Ybqk
         /LKeP7bKRzBKNx7IMuYAW0F11fZBpNL4hdynMPRuQBHOxYNeMN4+vHBZrPoCz1EnxiuP
         VJgs4h60RjG53KPwi5h/E79nvpNPr5nsG35jjQRin1WURr4QrYvcjpzIOIBKOWoxdbDK
         N6DDmLgkEjqO96mb+UoPUXSUApFK5zdf+hXnjPJf70KgiymX5e2z91n/Y1+dcL9WQqrZ
         Py1GCprLjlCI9mSMs9CL34cATZdhw1bysmXNuJNTi5F9ZJ/cKrl0W5hew2WQyS2MD2Uy
         9JbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786476209; x=1787081009;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BeGshA0Vgo+UzbU0fiiao63/SMTHgTeOeOGAfbCNRM8=;
        b=DD4kjMo1aPSeGnzh9w56MXQWqCbvEZ2uRUmX1QkT2Y2AZMieuEtCWeDWqiQSMafsom
         uQQkpCc9t13DRBEjUkXyVi3CtyQKeEz3isbcynLGlGScQhH9azBmaIx7XS7wmSZzxmy6
         iqXy1FxCCo1PY103wJhQa54YWn3JIqguf/6CkzpWzzkhW02LZZlhV+21MRmb7FGvqi2u
         gsi27e+0y1Jtmf0b6afjv8qFj7WQnlSNGp6mlv1AJhJrugTNWka+10WHL9xrkjbBNGtW
         1ZzphkpyIGJuGPxKdQ1uqDFigVRxl2OW/hXOhdSjueh/qM0TPRdewcK1xrVnL/zOCzNk
         Spgg==
X-Gm-Message-State: AOJu0YyrMhvt2rb+6+RCwuwnFzLwMtX0JqPkiWMgAfllNo01/0Gz3kp6
	GE6AEUJ4p4puMbVlwHB2AgP2BF3YUyEKx9FncjYDo2jZ1tgnJU8I4gm4n23nmG3TyKNQygVrJAG
	y7C6nE0JbKMuLHVKN+Q==
X-Received: from ejcyl12.prod.google.com ([2002:a17:907:bc8c:b0:c12:9029:1b1e])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c16:b0:c20:7cb1:9046 with SMTP id a640c23a62f3a-c20e6072f0fmr297617666b.8.1786476208788;
 Tue, 11 Aug 2026 12:23:28 -0700 (PDT)
Date: Tue, 11 Aug 2026 19:23:28 +0000
In-Reply-To: <9huzldaczcr4.fsf@tarunix.c.googlers.com>
Mime-Version: 1.0
References: <9huzldaczcr4.fsf@tarunix.c.googlers.com>
Message-ID: <9huzcxvotqa7.fsf@tarunix.c.googlers.com>
Subject: Re: QNS: ARM64: Cache coherency while doing Kexec for KHO
From: tarunsahu@google.com
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, will@kernel.org, changyuanl@google.com, 
	Alexander Graf <graf@amazon.com>, mark.rutland@arm.com, jgg@nvidia.com, dmatlack@google.com, 
	skhawaja@google.com
Cc: linux-arm-kernel@lists.infradead.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_122331_420762_324E66C6 
X-CRM114-Status: GOOD (  13.47  )
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


+ Added more folks to the lists

Tarun Sahu <tarunsahu@google.com> writes:

> Hi,
>
> I have a question regarding cache maintenance for Kernel Handover (KHO)
> preserved memory across kexec reboots on arm64.
>
> During kexec, all other CPUs gets hot-unplugged where they flush all
> of their caches so there will be no issues with any KHO data preserved
> having caches on these CPUs.
>
> But CPU0 still has not been flushed its D-cache (Is this correct?) and
> it will only do flushing for specific area by kexec_segment_flush().
>
> So for KHO preserved memory, if its caches still marked dirty on CPU0
> they will not be flushed?
>
> Is my understanding correct? or AM I missing something?
> Also if this true, This will be a problem?
>
> PS: Pardon my less knowledge on ARM64 cache coherency.
>
> ~Tarun

