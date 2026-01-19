Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A0AD29C35
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C44Hzf/BGJ1hEivAUCRdCyF7sts8+63+SuDB5GtrMgM=; b=o00ZllMyi6jA16123HPTfUexzf
	HCBWDZnJ2QrDcJhrBQZFk+s8Kq1Zn2K2cCWnZFV7l6YnweU2JSFkV44YVm+eW7Xwq/BCMDnWPbQZ3
	4yHOHODLIBYTsVDAUBRxVSrL8pK6VEKbu6LHKeK8dN2EW3AozFUzDEJtXmFThhQfDBlBZkXOAF1KR
	yu7QYGyEy2/dupL40VCbF2vGAz6ncbn9V5C/gP9ILAbscMQBpbUxbOm57W8U75s3GvNMIxYsZYvoN
	fhi0utagr8YtwsNSGmNb+mESIF3RfBc0wUmIW8iQjS6AtGgxlxHqMXN9t4/4oYptMdGST9MfyBlv1
	x1y9I1Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqPr-00000002HVI-0SNX;
	Mon, 19 Jan 2026 14:39:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqPl-00000002HUW-3RQV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 14:39:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so25801125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 06:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768833571; x=1769438371; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C44Hzf/BGJ1hEivAUCRdCyF7sts8+63+SuDB5GtrMgM=;
        b=yM8aiID/MBwcmLzssABbiG9lIq6uJCeSNX49baqwVtWH/EKbXP56wzGuDE7an/etci
         rZqhzFRyrR+0I8jcoAnrKHctiNRIdYnBP2ni48eIxqY/8tGF7g2Y79hKSpENlsMBaVwy
         aboOfi4mjtvBJoy18BqkiIcIgTc1TMF32UgS3A+D7fUuKS6vBNctxwIU002Ll/hw+oT8
         Z0Nvv8x0yZjYeI2zsD/uAlgbdN8POw5AZ6P52S2lhLif6En293V4C+buljdamjQ/NhcP
         N6jwLKxT1qAxjjso8++l8JOFTQ0qZtTjY2sPB5Iq+VUC5QOWqG5AzHZ3m5++dW7VXXrL
         7Vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768833571; x=1769438371;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C44Hzf/BGJ1hEivAUCRdCyF7sts8+63+SuDB5GtrMgM=;
        b=Oqn6PJE45A0ciC7A1AkfFf4slUNgSkmAqTdcNRQJc97X+8CKjNiUe6oKXoPB6VGJ3G
         9aKBVBsLZjuh/3eBM6cxPn7UPoDYunWoMZi4+eqZkuoNggFZaZLy9x2U4C1i9QhbxafN
         uVj2zKFh/k5ZIKl9qYxgLwfopQsTyFQz2z3ZRJlZugyWsZKliYsAjidD4jApw9t7wSrW
         9+30ZLMUiiu4xGcR4eFn7f3BcS0sjnnpgBJQEJ+zDgDZ6JRDOpSsfejKtglK2l5Z2Uxm
         7m3cbf1VExKE2PSCkCI7gI4c9sYe3hLZtQJUpZv4uO26TPd+aSAGuqD7GElfvt3B5iBL
         OY9A==
X-Forwarded-Encrypted: i=1; AJvYcCXumFnM/qPcbgQmpwHYWHaL+WIOB6u/vRpV2my3FgoDkqPz14j1p2YN1l038Cev8dQ/Oracnzz3SlrlhtziMJXo@lists.infradead.org
X-Gm-Message-State: AOJu0YxUsM6wkkXAs9G5KJDmflH/oMQt+aM4bq/NYOKCIuVlYsnVx3AZ
	qUvhOW+XJTpdeWdAfhOvrJU60lPHTT2UFDCysJHgtoMNSoTNTivmsWVdEIojVlCkrsk=
X-Gm-Gg: AY/fxX68+bwlxRXWzADz7GVctgxqm+Y0/NRVPmg8ptE/+Buf4bOhRtrB7HMjJFctPNY
	UvtWwml3TlB8OjOcHrIpiADwfzLFgRulm6/Gr0plUE+hRMi7T0CHU9JUPTROIYaM76it6AuANl1
	qvfFZ4V8I37LnB5JZP8pH5zrYBrNvtbbuIsbF34fO6660od+AtQMoxYcLqmN48REW4RgBprzcJg
	xl2guYzSJ6wmO8g4x2VRiCpx0j0+V4X5m+gmRN2DkjSPqIcPRkEONdnl2X18atXBh/DznEWWXqB
	SCn6usCqsrzema1d/An96K7rlccW5m3ZkIzQXiybFStS/HnLIE02LDKvy5wJ5JyB43cjSOtFwga
	tySKPd+TsznHpdawvwnnUXgZa6zwjejG6IvcxjKNquWAkgepAa9c0YYaIzX8dnODiqAgKaHeqqs
	yv3RIbKHKn7oEz/cuiwxA/cOFMRUsLHiAphTL+lomsvHT6vny5IRQQI+HcVOms7DevRNX7JLlM1
	THVDVTo09g6U2nK7mmD8I58zrBpOBsS1FC5Bmjvfdea7LuOwu37jtklhbku+MXlrulM9Zra
X-Received: by 2002:a05:600c:a305:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-4802521516emr95758905e9.24.1768833571562;
        Mon, 19 Jan 2026 06:39:31 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f429071a2sm249813135e9.11.2026.01.19.06.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 06:39:30 -0800 (PST)
Date: Mon, 19 Jan 2026 14:39:28 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] iommu: Fix NULL pointer deref when io_page_fault
 tracepoint fires
Message-ID: <aW5CIA1aCC8FVyFl@aspen.lan>
References: <20260116-iommu-io_page_fault_null_fix-v1-1-6c20c2e62987@riscstar.com>
 <fca8f2cd-c3e5-40b0-a793-bded109e37bc@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fca8f2cd-c3e5-40b0-a793-bded109e37bc@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_063934_076745_155A7D04 
X-CRM114-Status: GOOD (  15.44  )
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

On Fri, Jan 16, 2026 at 05:02:35PM +0100, Markus Elfring wrote:
> …
> > Fix this by adding logic to the tracepoint to safely propagate NULL.
>
> * How do you think about to add any tags (like “Fixes” and “Cc”) accordingly?

I could add a

Fixes: f8f934c180f6 ("iommu/arm-smmu: Add support for driver IOMMU fault handlers")

However, who do you think I neglected to Cc:?


> * Would a summary phrase like “Prevent null pointer dereference for a tracepoint”
>   be a bit nicer?

I don't understand what is wrong with the original phrasing. Can you
explain why this change matters to you?


Daniel.

