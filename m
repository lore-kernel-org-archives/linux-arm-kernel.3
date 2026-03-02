Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2F3EA4E2F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYT3s1uLaE+cdjmhthdxWYgUp1I0ysA+t6u348hSK40=; b=GCeNabwgp37PX93yXaq3NYl1v4
	qgJhkU0Ml8bvdNCflOsRIf2j9PqOp6t8/YyPTzBR2RcRzvlC2IgjJd3r7j1rK3Hkymp1UsJ8WVd7l
	I2S7YzeLqftSzXpxhvc7uFFcnArIMe9f8JFaSm24HpafCjxqGhRVLxdfSeGYFvvD0BVJ94tbcjxBj
	m4nrGK+Qr8nc0znKxu8vjjaHCbb4uHXpQ9gZVv4oCamdapPJRkCj+je0IxwXiacOPTLg/96UToGTw
	0VPNWgTtytpXG7PWhTw1k9ZLNCiaJ5qHqA3/klEERRMc2qRxAY4QutThGVPUnRSaGYu4X0MrgKoOv
	TZXobzhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5ic-0000000DRmi-2RDi;
	Mon, 02 Mar 2026 16:02:02 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5ib-0000000DRmA-0fg2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 16:02:02 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso1777554f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 08:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772467319; x=1773072119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYT3s1uLaE+cdjmhthdxWYgUp1I0ysA+t6u348hSK40=;
        b=Di/uCEbNvnBgdi3wyuvMvLG37KVHjKgn49RDWVcAzlwXHYbT9ufOyUlgc0ahxNFZa3
         vavsmxT9WL3g1+WKPrAxg0ksKXa8NcI/TlLbAMHtdkt/Jw8AKvMUMGF/9p+Gl+J2hUVR
         REwctyNVPU2t0UJc18uRgfiMD4g1qAA4V2gcK/RW9MX+IylkKHRT1FYM4njRyXh+pelr
         9bPWPHQ9DA024pN+3bim+fUd0rri6pCR864WX+OlVMGGHgqNOy5Qph0crXOjWZ63IjWi
         TwCt0aIpWIcEN9d/kjUxd63n184iUStDjCw9Ut2RLhetZP3X1PwF/9lO2Rgsy0S/PTTp
         OlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467319; x=1773072119;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wYT3s1uLaE+cdjmhthdxWYgUp1I0ysA+t6u348hSK40=;
        b=eXQnFM7VoC6RLj/btwCalhWBfmMSGeY2Exb86YaZU0T+SmcdJ9VdsBlJmQd4TQE3q5
         vGhRx7POEeW1rAFj9eImSPB31kUThktqqn87WrOD22Dr+c9M7icC/WFKv8A/sGd2n1zj
         go6AqCV5wBM+YB+hw9PAqIQys8RrFgeX91FWJck7IKoNiecEWRWP4oTJn0/7pTRoYRFm
         1PArTbv7sy6HvXLI0f03ATIhmeVk+4lIUIOHqLKsLJNrY6t5a2rbUfld4ZqYb3QI3dbD
         il8SRdLKwFE8sBf0R+ydizL4WpXncDY9vd6VdqJWXVvwi87vBUDItUgpB4sTRzKL3Zag
         GJkg==
X-Forwarded-Encrypted: i=1; AJvYcCUzwiO4aYy1nlV6OXmwHWHiH6G1QLHSgEF1r8inQXE2Y2/+BARldx7SCWL4xruNpyPyad2PITpzKAeNrWYR8GtD@lists.infradead.org
X-Gm-Message-State: AOJu0Yymw5W4yv1WaLUmwUqF9GnmZ+ofoT4JQCe6NXHKUHTlfSlEGv/M
	nn/Ako64CNO4rZRExyQApPikfee1dDAg/KDFPFHUsBoQa4ln87DsDDyFfoLt/N85IpU=
X-Gm-Gg: ATEYQzxSDjLFlIKsxqconXaeYuoO+1ZsA+qQSLAUue7mhQuszj6FRFyWgo6O2HKUZiC
	mt2i5BqC2bGA05jNm74WkQaJ9iEoCYQwToAkc/JOn7RD0jWLNW9iLINoeIr9vQL6qvWRLenHKWI
	jeDdaBV+BiAqXMh9KyLhnSRbUG4vkGGCiQr4qVwC5P1fVwWYbD378+yypYFhJQN+bqIi0UgFGj7
	8q+pXz26zkm+4HuSvwLhMQSNZH459KnxwkIC5rDmhNOfwGNFUb/ONvvD99iNhEhI0+Nc4OEXWkU
	MJlyTFyz7JRT8Jm2CGUy8z9B/As4Js58QCz9Ba36Ryumuhmo7vRDmolyWkRUTzhMjK09L/hgQeS
	P98/+6HzqwDUlWoOREmYkOhKG8Rx2vbOlddweG6OQaMErdo4t348+xLp8/G+lY8yWDk/v06ejE8
	OcjmK2Y0Nyr70J9X8L
X-Received: by 2002:a05:6000:400d:b0:437:678b:83c2 with SMTP id ffacd0b85a97d-4399de55755mr24443061f8f.54.1772467307133;
        Mon, 02 Mar 2026 08:01:47 -0800 (PST)
Received: from [127.0.0.1] ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75a25dsm27765938f8f.21.2026.03.02.08.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:01:46 -0800 (PST)
Date: Mon, 2 Mar 2026 16:01:45 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <71ef2e5a-1c6c-42df-9aac-17185bf92ad3@gmail.com>
In-Reply-To: <aaWWBned-T74lsXl@infradead.org>
References: <20260301152820.2589291-1-objecting@objecting.org> <aaWWBned-T74lsXl@infradead.org>
Subject: Re: [PATCH 1/2] arm64: lib: xor-neon: remove redundant filename
 comment
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <71ef2e5a-1c6c-42df-9aac-17185bf92ad3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_080201_205442_34277393 
X-CRM114-Status: GOOD (  14.12  )
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

2 Mar 2026 13:52:07 Christoph Hellwig <hch@infradead.org>:

> On Sun, Mar 01, 2026 at 03:28:19PM +0000, Josh Law wrote:
>> The filename in the header comment is redundant and not recommended by L=
inux kernel coding style.
>
> I have a pretty big series pending that changes this file in
> meaninful ways.=C2=A0 But even without that please never send standalone
> patches for trivial cleanups like this, only do them if you have to
> touch the code for another reason anyway.

Hello Cristoph, I am sorry, again
Since I am new to Linux kernel development
I sometimes make mistakes, it's normal.
Patch 2 should be more relevant, all of those I got under checkpatch.pl

V/R
V/R


Josh law

