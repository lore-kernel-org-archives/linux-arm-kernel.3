Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C63E87849
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oh7c5ZrGbVkNtlDGgPCsWmK0BvZ9p6QtCVprM62UDvk=; b=ZBHC+6i+VqSr8vpiugzQPlldh1
	h7bSJ1bjmxWVwR9eEfz9BDqWn2Skl23pZ2/nnvgkDtDf3OR/XOJAr00lGA7ViNQ+ruFnAhHvRgUAP
	inxJHKUDoJRLE56KpQhyMDuekBQT/20DzOZCAMRktb2UGoFZVwH7F0l9818B0SnO5A6o9sPanzPcA
	BOeI5FbE2LKiYbj0gtI+7JDwxUoSHFkmtvdh3Q9LVww7E7NLTGHo/ibhmnKpqRcUqYaa2pwoRMm8k
	JHzSwd1aXD0ipHvfo0kKUL25RUHg16tKGoNaQ8EVPPM3FA7ikGUdoxvtBRVkdlM5zj8BNd0oA9M6H
	ekvy6+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJgD-00000006zYg-16fY;
	Tue, 03 Feb 2026 16:55:09 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJgA-00000006zYE-0qMr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:55:07 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-64bea6c5819so8496907a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 08:55:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770137704; cv=none;
        d=google.com; s=arc-20240605;
        b=HX4voKk7XipvkgiSCnzpc46PA/jnrJ1pAHBLAU7BpxKiJ0wD2XFolP8EDEUeL76mtF
         tL4lhtfpR1dVz4JmnTISNgPvq5engb6kkSkc+yhJUcfgLaxt/uY+bcRnq3i+WmjDj1d4
         8zEFwUqR1HoJU0E/3ClaWVEx+Ci7/Z8vLWwX8L7wlO7E/dl4VBpnowW0YHkFQb1j9A+b
         78tXaCbYm+WHXxgHeXF6gGOU/uKCAEjg1DgRGqW2DrwzmRHL64u8h/Gj8dcgnDi3qrdO
         RujZ6ltRS9wgVHBEWcLwPoVZjVolvouDbqPiEgtOMrGLTWX02aFpsHscV6nQAjhUwU5g
         JeOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oh7c5ZrGbVkNtlDGgPCsWmK0BvZ9p6QtCVprM62UDvk=;
        fh=BeQ6gwRYpXkzo4boKPTJuxLAiEA5wknPdLuSMIPjQxo=;
        b=b/qz8poEC21G2k0LxvwXbDm3uiokf3/R6H1OAsFgsqoG6CRjKPC1nKZgr046nl+OJz
         bkf2WkAz6P/SBGB30QJuYUGkl4NEe0JYPhOQQQTzfgEM5Jcy0spr0a9/GIhbdVrWhM/c
         EAqFQxht2xIGv8CmwEPEfCzOx/o7+Xgtti1Xmx0dIYzc83HsgESvv24RmKO+Di733EUV
         0gJmoZNQNqQFWk75M85I8UG6v5uA6ocHkXXQsns/TMeqsM4Z51you6RCCiHaKhkQU6Eb
         1F3IVV16VRGk0/box/+jb9PFgaVfOIJNwN9Mwkr/pK6OnNDK4EG5D3XoX7tk4nYnb+k/
         SRfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770137704; x=1770742504; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oh7c5ZrGbVkNtlDGgPCsWmK0BvZ9p6QtCVprM62UDvk=;
        b=QF6T9HWfA++bkUhjh/lgIc/xhL7UFbzoalNawuOx8iw6Y4iZnI6NfdA7MIAU/nXc5g
         eeBOyerHSgL3dHuKhDrZhw4ihwQXvvUbe+5Tm79kZNSKibghHLmy5Im1jPU8S1b4vWPp
         da8Gc7V9c0iWP5sWQtBG1N11uCNImRemATT/5Q1WFYMsBZwzPsPGkFBt0phpYkEDR3+C
         DBUBycB1Y0aYIkwCeiHH+fNF2GK+PPItVqXiX0gvUPalUs0TLZwts/k+/zFthpSyqGYV
         p45ErQx1uDv1hNRPlrqdDlupuNl48mg62lplZh/f7pmRPB/GXXhzv1AxwMzzcsbms3ZC
         X65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770137704; x=1770742504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oh7c5ZrGbVkNtlDGgPCsWmK0BvZ9p6QtCVprM62UDvk=;
        b=G/M0lDqb1BLMx7Zqtl0kPckTYkcNlsoTKpayJ8fIZtneZ5hbaQJvw1gnfVnKmRdstm
         cst7xTKJ1UCkS1ts7V4eE9rlCz56lAYBPkVMAGcsKrMVJy5qH8vPeKpfTXwhtKSASRA1
         Pzurvv7Ppjx+uFuICVWJ5YFxgO0yBwqSRVOA79rjnBo0HEcWW2gwMLshqQr28H2QhtWQ
         SPOu5MyBHLvQnB5NxwwhvIFi6fKqOYL/FbD7KHYIRwaKBIr4I99M0KQG4WaOGyRYN5eZ
         uSk9RUNX+vV4RaCGhhpo7dsCHUjoGEokkyfV3wzUEDbCriMPjYhHWGpTdR6oty985rVm
         ZHMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIKOAKtRF6owuu5gJhtBNJ1EN36cfr4xkN0XTxO/6zmyLPSmOkGIdNBmgPQWLG9Bjy/9wFpy1K2aDB1FFk6ZBO@lists.infradead.org
X-Gm-Message-State: AOJu0YyU0uaM9zQPRzgi1sXmpxWN0BCn3qQ8J/yijz4yXr6Yt6zsvm90
	xtyv84Z5cxqjAOsEW/aNzfLomXy1MIErZpVFpne3bM6cGJ8TRjV8/xGiaNFZ3XXS4hEwC7Sji2y
	T2rtFhYEjYrw9YBrsY9lkyydoOaRKpzA=
X-Gm-Gg: AZuq6aJm0eVT76ZQKOrUot2tGUKqjJZHkR0ktEg+RnvCBRJZbVyl3s+PSQe+AyuG2Yw
	HgiK57AIXOyj+USa+AT1acki5ISgAtg9KNcye2YG9bZgBtYc2rEPQRsEgsUV0g9hmuwOqiEBKBy
	A20P0REdiqeFTk0+FRAr5uAvsB//Ma/nvBlLF2D4Pi/4HUzM1mfbN84Dp9enjr8Btpn0aCZ9JHx
	4FRpiu+ebDiqpN2skwR0DMYRvcrxOc4tCR5IvVw9OTAYr7bHs5UhhnF+EZMTwQNwA4F0jbqxw==
X-Received: by 2002:a17:906:eecd:b0:b87:173f:61b with SMTP id
 a640c23a62f3a-b8e9ef2c012mr11849066b.9.1770137703947; Tue, 03 Feb 2026
 08:55:03 -0800 (PST)
MIME-Version: 1.0
References: <20251021165212.749372-1-a.shimko.dev@gmail.com>
 <20251022-rugged-archetypal-wallaby-ecbecf@sudeepholla> <CAOPX744bwwZHEODktumJbE1MUyfDgYj3vrexT7GRBZ6BTrECXw@mail.gmail.com>
 <20260203-gregarious-intelligent-crayfish-6bceec@sudeepholla>
In-Reply-To: <20260203-gregarious-intelligent-crayfish-6bceec@sudeepholla>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 3 Feb 2026 19:54:52 +0300
X-Gm-Features: AZwV_QjfekTZzde54amai5WOPKsOZWNirj4agaTKqrszEPOHIlfhExZ8j_ZjLlc
Message-ID: <CAOPX745MVJ50bPPeOjKvyO9N=NZKtpUZNcEN4_bFQ4sCAnvUUA@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Add new sensor unit types
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_085506_265238_431EAD63 
X-CRM114-Status: UNSURE (   7.39  )
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

On Tue, Feb 3, 2026 at 5:25=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.or=
g> wrote:
>  Let me know if there are any users before that.
Hi Sudeep,

There are no users before that.

Thank you!

Regards,
Artem

