Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BF2F47CA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 18:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rT3HFFE0hN5Iv+Nkv4cLwwjitenY62fCR7k08+CamVo=; b=HGghoCpkZ2iAOjidah/ICNTVjj
	KodWBDBwV01eKzpLrOSYLxQ+A6+76q6p51AAfbqpUZjq685HuM7M0FRmSdCH6NU6o3/i7+FxRV2oF
	GwoPgh/XMeDmbypiiZJnrBhA9I/xRJEiE4ooJEiJRCkYcGo61zyefTPil1YzHR/oE3suC3w04PssP
	klgOirwVOSXqXo9UT4HmM5AvADDys3zqF+dlYwEG5pF2yBpBuWotIlkt1TI0ITNGOSrmlM6tgyyDc
	8rk+14RWCfdZYy2amcp1xTPFovxOR0nLkGmzc6+tiHlabF4vXIUedPgtAu4fv5HLrqMuGQd3PFgxu
	Eg1oiJNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDXx-00000002ONr-3YKo;
	Thu, 05 Mar 2026 18:35:41 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDXw-00000002ONW-0biO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 18:35:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48378136adcso50760145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 10:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772735737; x=1773340537; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rT3HFFE0hN5Iv+Nkv4cLwwjitenY62fCR7k08+CamVo=;
        b=22X9eMFMLj2rBVtMcIPHMubf82Zz3esnBgeqhn4XnDy4oSWlbd7O1JjZQAKxCLxxDk
         s9/0WsW6PU2V9J6wNmPPIWIjEaLOFZ5scPzZlDs93IWBsThPy3x8zFnNcyPHZI/J04q1
         63z6BlyiogDvvByaobL3lgR802OaiTTNG9YjlQSAP2EeFpgYqgECUNmxV3ONPQgNt8Cc
         j1AzPoaYv0o9lF90AqE9UWt/KeKoNLhDViGbFU0AViE73ZlYRN2vd9UK/In1SjUOzeha
         B6GlFJo5j9PJyk+oRL7I+ybwH/Spd/8EfIo0yzdjWHjKPoplvV5ZEiI8RVN5tc33M3TL
         uASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772735737; x=1773340537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rT3HFFE0hN5Iv+Nkv4cLwwjitenY62fCR7k08+CamVo=;
        b=T7IU7RpMGm97p6+95K/O0sUKR5Khf1AxFbbD3YgoHY6vkQFka3Diu7jR/a5hz0B5vm
         +PuwcsxJ/QWVwducddVSA2Mn2XGjdJTj/8fzvuI+TocRba4jNshCS5DGszDZrqaIfEt4
         ukGWF87TW6/MOnK4WSBddmWrgCJ7Y23m6cvtrtzL3uz/rUm+/VsPH7xXOrgzJjWJYI7W
         1iNBSpdL85uEyQoSII3vOIe5nEyRWAgHp8b4OyE7bSeDaAAvVKpmEWrgVo3KS7fBiEtF
         iTodufEZJ22k9m3ec6Arq7IvSGeiZk9vThdectzwf7tc2LPQGuPZW9D0Ar/b42oA1gmN
         Zcgg==
X-Forwarded-Encrypted: i=1; AJvYcCWqr1Uj9HpY0himSU5/qfyRNAV2N/OXnH7bPtWiMFQ1wc/ElZYyfGPprqbrLQ4yL7H4ew7zaWaJOzWl6adTW6st@lists.infradead.org
X-Gm-Message-State: AOJu0YzNB9XPIh8RG/DiGBD7nOw689RTjvEU7K6neliiYwN6qNXlrONb
	ULfBeXJ0thMmO9Q0YgMwm0udxqpjj898jcjA7iqNJUwRP/5PuqnHRaKxO2mxiJNhbw==
X-Gm-Gg: ATEYQzw5ih0jUNOYQ80yrQNpldz82W09/woXa4rZBk97pEQJ3PfmMW7YtoiFqt6qzVk
	X/L90wA17ckh+LqySm7HX8HBenXTLTqbiDT5pMWLh4HzipG+bBGQEfDTcwYmeBPFpjcuevpjw8C
	PnNwF/RkY/ewxw2gHb4OE6CDViCJNHNsjPn8rPkqZjA2U556yfdrE5BmCZXD6U/UE7sbkDL9nJa
	AhV/x2v9+LDvvtHQ2F2Sf57gVr9IIsPtzB0K5NEwAxtB42VQMzJsHdJhz9uWwB5m5D6YRS8URp2
	X1N06ReRfARgGshnoywnuFatvF0Ay63NANlga3KL8PdeR9dGiS2F5jljWq/ep56p8pudpyjOhbS
	MHVj36RHK330+6CjlVw6dapiKUxXWNhftwxg8fmIwQQ5NdF4I3ZU6HMsEEgnhoo4D60N/rMIozl
	JFpTQY5qbLqhD6MPqJgrdKN3B+M4fscArNcGFLX9q1Thdf/po64jHJcUb5k+Aop6LtxIY=
X-Received: by 2002:a05:600c:529b:b0:47d:25ac:3a94 with SMTP id 5b1f17b1804b1-485198840ddmr121717605e9.17.1772735736986;
        Thu, 05 Mar 2026 10:35:36 -0800 (PST)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852378de86sm2222085e9.4.2026.03.05.10.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:35:36 -0800 (PST)
Date: Thu, 5 Mar 2026 18:35:32 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Marc Zyngier <maz@kernel.org>, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 00/30] Tracefs support for pKVM
Message-ID: <aanM9DL_jKkhHHAF@google.com>
References: <20260219150307.14538-1-vdonnefort@google.com>
 <20260219130220.063c8db3@gandalf.local.home>
 <87cy20eeg6.wl-maz@kernel.org>
 <20260305111703.6346b243@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305111703.6346b243@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_103540_191377_338B898E 
X-CRM114-Status: GOOD (  15.53  )
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

O Thu, Mar 05, 2026 at 11:17:03AM -0500, Steven Rostedt wrote:
> On Thu, 19 Feb 2026 19:11:21 +0000
> Marc Zyngier <maz@kernel.org> wrote:
> 
> > > 
> > > Then the arm/kvm folks could start with that branch and add the arm/KVM
> > > portion of this series on top of it. This will prevent major merge
> > > conflicts in linux-next.
> > > 
> > > Does that sound OK?  
> > 
> > That works. Just send us a link to the branch after -rc2 and we'll get
> > that sorted.
> 
> Vincent,
> 
> There's a few minor conflicts with this series and v7.0-rc2, can you rebase
> and send again?

I'll send a rebased new version tomorrow.

> 
> Thanks,
> 
> -- Steve

