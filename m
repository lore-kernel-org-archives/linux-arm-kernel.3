Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7C2C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/n69lRzU+/KobSt2jufolpdWS7t3iHXcIlRoKqP9Tf4=; b=WaHCyrZcr6FHTDFw0/uwRPzc4T
	KkPv99y1k4rdy9zMqp2im7f4z9vBIQ+7M54MTAFChn6Vwk9XcKcfpHWmymjiT2Ss1mGilJpzATWNZ
	LeMPXuCQeLmf4VGItkFBHx6AsG+Jz1sOtRqHYOAFF9zLjM/JT2/aG4JS5Sk+1TZqJzD50wjCn6cwD
	EQGLwCG2ojSs1wIrw6VsLF39VPZQ92RVrrRTYkdc4yxqFU4lOVdjcXirorJtu5EIqBWL5UDnd6Dtk
	H/fXtOBbYJDSay0jSuwnOTyRwBkLZzcrv5/wGzn6KYIXd/YhjMwwPHZaKmIHI0uCpLPlEgjTiIoFJ
	t0sggVJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxKC-00000005nlC-27Yo;
	Thu, 06 Aug 2026 12:35:52 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxK9-00000005nk8-2bMq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:35:51 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c2055573c8cso170364866b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 05:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786019746; x=1786624546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/n69lRzU+/KobSt2jufolpdWS7t3iHXcIlRoKqP9Tf4=;
        b=XS21w2RM105uc9rdry9hpzoWU/oYwts/OrFQTsRLU9b41sIuEqtzYqY2G4EjSmPs31
         gmDrAFt34A4zk2Xe/jf/GMiif0Ozev+J/3SqvIV1lVOyavh1ONqVwTzqbc9m59VRwQQg
         HBm0fuxQACB5QvvKcAmZcofh5jqgG+nmZjevXJsGc+q+Q/32/u0qOFihIumTG3NWSFYi
         4Vskqobljqam7oBPoke3401X0jHv4CNjTSGzw/7Z75U3LewOFLNVJAHXkYp9WEHKavjR
         GEXQXO+s8ov+K3XP/Q2sNSpqZzInL9MoJnCQAiyAz/ZRqEdjEoMuAZdra2GAnv86mP9e
         4fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786019746; x=1786624546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/n69lRzU+/KobSt2jufolpdWS7t3iHXcIlRoKqP9Tf4=;
        b=Nl4wxWLmn2aMI4a3Gx8MBs8gJ4kSx1xf/ZTU7krjBErwF8S5uD2pgT/ZDrllC34Xi4
         iYAW2Xo6YbI56NWdKEZRmmPnyy6wol3A8gAYIjYMKIy+8G3pI5yKzc0d/Pb/Zf3YuJ+T
         BC33Oq3ryzyQMRMSh+GR1v2UC7tuCDv9PfYohOYAUr+4b2DWHhJDnLf67xIZAQpiZ/+W
         OxcU42pdUteLhnShbpoLu9XFSBa8vI9LvbgqKsngcso+K/3zp6meW+xXfNrRTin1M0ms
         ot4qLbta1Jxh8k0iuDlsygmRCsb7XYY8PHXy6zl231Mw6pWc+uSCqbNsWw/sIxMJgfiw
         n9Ew==
X-Forwarded-Encrypted: i=1; AHgh+RpcImzT/E6BmgEnBvMi+NI+l8We85uC8dhoa6V4cpfnFVa68c2fsOnBBwbRn1eObUKHkHIqJWnA54iTX5jJx+M8@lists.infradead.org
X-Gm-Message-State: AOJu0YyQDCgDRMv/o7LlfUwNT+sMZdD+JD6dPgQD5S3Xhm7pUnzgMZm7
	6wweFiG7B4LeBx0BV45bqHoJ4QjfZVcUR4e3yBqLpAq9Wws4fwq8cN5g6O1pNEzWAzk+8xhXsjw
	G+m5bzA==
X-Gm-Gg: AR+sD11HLXYTIHue6+OxPpc8wAB6/vd65HBdWvN+AJZScuCQDdGElwjFxixSBauimuH
	jNsb1I86uXD35MfvInXgZnxLwFEsRqE2GTzR/9TYdUyV9bOh8vCyNt4psTJ89L3g4Kd5DlCIHj4
	WWwMjNhwp42OUQ1tqkIF3++e2zPkw/oyKRag+Qu9/tPF96GJOKMXWQbEItucQH2FJOYUfoz4vBO
	EMTGzVgolpTKS6exMOgsLvSa5K77ZlsMp9znxtBdTubIUIo0ntg3PvqOL/eOX0uHiq9sxb1OvVt
	x5Mx92YADHnoea3wY3t2wNrIY78LU3PwKpLaVON0wl8dB6p9JuBgRtQ3XeM5aVBnw3DeUQ/brIH
	IBUXi50sLXgRNW0qv/mW5RM9vyjBLlaMm4dIWpSN0ACoQ7fycuB/VlY9D2r0ERjNgQcQNWVUcfi
	nun2fPhsQAlTsRmLe7CNlXUiLUXpgw6ZvqOQm+56dh5OB2xxK9HXCC1VPYTBxD4XctsxniOL72Z
	xAKor+tlV1i6AGqCTau99r8dKdedLm0
X-Received: by 2002:a17:907:c00d:b0:c16:9043:7973 with SMTP id a640c23a62f3a-c2039af8befmr794258966b.4.1786019745003;
        Thu, 06 Aug 2026 05:35:45 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c203642435dsm244849866b.44.2026.08.06.05.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:35:44 -0700 (PDT)
Date: Thu, 6 Aug 2026 13:35:40 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, maz@kernel.org, oupton@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
	alexandru.elisei@arm.com, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com,
	ardb@kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/11] tracing: Include linux/types.h in
 trace_remote_event.h
Message-ID: <anR_nEDeWLYKIs7P@google.com>
References: <20260804112317.1937387-1-fuad.tabba@linux.dev>
 <20260804112317.1937387-2-fuad.tabba@linux.dev>
 <20260805165432.0118a513@gandalf.local.home>
 <CA+EHjTxZ1tBfau4eK-nOdqig1xwngzsq8YyHtiE-iAMkZpSF8g@mail.gmail.com>
 <20260806081952.5cbd8170@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806081952.5cbd8170@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_053549_705356_FE69C797 
X-CRM114-Status: GOOD (  24.46  )
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

On Thu, Aug 06, 2026 at 08:19:52AM -0400, Steven Rostedt wrote:
> On Thu, 6 Aug 2026 09:43:00 +0100
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> 
> > > My ack still stands, but I wonder if we should just not use the include and
> > > instead s/bool/_Bool/ ?  
> > 
> > I'd prefer to keep the include, if you don't mind.
> > 
> > As far as I can tell, apart from the typedef itself, the only headers
> > built into the kernel that use _Bool as a type are a uapi one and
> > arch/um's user.h when it's built for the host, neither of which has
> > bool available, plus what looks like a leftover in bcache_ondisk.h
> > from when it was uapi.
> > 
> > The include also covers whatever field gets added next.
> > 
> > Happy to switch if you'd still prefer _Bool.
> 
> The reason I suggested this is because I'm not sure how much we want to add
> Linux headers to files built for the hypervisor.
> 
> If Vincent is good with adding this, then so am I.
> 
> But I rather have him give an ack before we do.
> 
> -- Steve

We have types.h already in several places in the hypervisor, so I think it's
alright to include it here also.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

-- 
Vincent

