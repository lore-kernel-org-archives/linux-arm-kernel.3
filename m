Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39685C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 06:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezVasPHsv6V2uw24MQZZeCDA47yUS9BZKb8CbZfcyRM=; b=i0UVPr+H8ETyd01LYZgzaSmTXF
	wm8+/WWACZtuam51YDUzEnzXpJP4uDrAjzoX8z9Uhjq35Q9r3pPPn0DzknZqZj959HOxHAXA2uY8a
	0+3iCp3ts9XcJYqxddJQ/ohyF/w8OsAfjEVr8Mm/lVnksHXaNLq1s6H1h1w1Bwnyx9mHG73GLGhQm
	NWoDYbXzSd4sMpB2D6r5f5tshq5dpZyo3atD2xofX4btuYS+cs9l31K5p9aMUa4mTU7OV8YfRSFjj
	CSWuQdVzLAFiG/biUHOr88aQ0wFruldD+A5oeagUyyDJpCdZxXcD3RPRy+JLXAQmZ39+On5LwBiHt
	40kig53Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSTe-00000009txs-1Suw;
	Thu, 13 Feb 2025 06:13:34 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSSD-00000009tm0-3uEy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 06:12:07 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-5deb0ea1129so689918a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 22:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739427124; x=1740031924; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ezVasPHsv6V2uw24MQZZeCDA47yUS9BZKb8CbZfcyRM=;
        b=Sp/DJPCp7PBfmN9CLDXTZxC/SF6PEfoqIGoj5S8txtJw7uOBogQ2idqpm8qxDr+ylp
         GV5gL5NAPHV6XGAbON9Gn7yekc8KuHY793q5bLtTpSYimYInWedi0xdUfr1zoxkXLbz7
         JcF1DTHgFtHOjhzEk03R+HIDUH9QHurXT6WaWN4wwpXT+879pqPUhUDVv/SUYEol9XyI
         UDJx7mhJNYqAztOEw/GaDHzNgjpZG+ElxE6sRnb0qpL+7+0jGjVfqCCbdQwuex5qbddN
         mgi2L+rWGmXB5Oxa0xlKjBB0O5UwOjSQ3XL+aJNrIxHz3b19wKZPu5HJTr6nvprsVr+F
         a5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739427124; x=1740031924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezVasPHsv6V2uw24MQZZeCDA47yUS9BZKb8CbZfcyRM=;
        b=tAmQwSQq2I2nFuzHJjChG/Htjz+88JP8Eu0qGWAhwBxxtT6c/12vgmxR+bdKaat8MX
         qD7Q9NPIKCoUxuwW31j2cnQoliED0AYlJjGe6cOIXOQKsCEtaLG+ISgXBJRXEVTi6SUg
         vs5ULD3j+cwc2Fwf9NZYat1k3nya1CenPr4Ip2ecnMRsQBHZ4oGVF/1cwySghRFfGmk0
         EAoTpOGILzypWif2ZYsY3Ag7Md01sf3wqR5aP9ZuZZg0W49qX7WDFOOCvF8g4Wi3vUJC
         U6OMfZ++KHHCjj+sd/xXGvNSZDeHjjy1m7mAF1GA4M2x6y/4M3NVGKKeL7bd2V22QflM
         HYzg==
X-Forwarded-Encrypted: i=1; AJvYcCVV0kzRXwF1KqtAbs6Krk+2ypg2D7Gvesapi9mNcro2l4PMKyTmSSCBCjW71GOR5o2yTeaOQPu7U+raMeXesZhS@lists.infradead.org
X-Gm-Message-State: AOJu0YyJKS21lyqiaH80jOnFROOrpwyxDJC8eGfBDEW7byvmCuNUool4
	F2fEOEF9Gopw2POsCMfbOlgI6jFaSptOpvuZZVH8tTWPJ8vCp3UaJ+aAeyrT7OOTRkUbzObjTAe
	IMkYEy4v7Kg22Tg8FWegGGENH9Wc=
X-Gm-Gg: ASbGncuNzx8F9K7UYEH3EPYd+wKbYyeG4vu8A4l67A5DSKTF+9poeOWHQXgtnHM4dpL
	JQuoaXJxR2kwoSy2NjnUNB+Kc3eVUMLicPcT+wTK5CZ2bUxYVVmpl7PvouxaQVhM/qXBvOLPdcA
	==
X-Google-Smtp-Source: AGHT+IG2eCeOPgCOnfGgxoLTFoRqudRFD0yDNYDBsizZdYJdOGMvWhiMMp4wcf8x7uF7eCoVLmRRUIu9w8hyfikuXvA=
X-Received: by 2002:a05:6402:4615:b0:5dc:c9ce:b029 with SMTP id
 4fb4d7f45d1cf-5deadd843c1mr4927202a12.5.1739427123579; Wed, 12 Feb 2025
 22:12:03 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250206105435.2159977-12-memxor@gmail.com>
 <20250210102139.GJ10324@noisy.programming.kicks-ass.net>
In-Reply-To: <20250210102139.GJ10324@noisy.programming.kicks-ass.net>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Thu, 13 Feb 2025 07:11:27 +0100
X-Gm-Features: AWEUYZluH8U6jOgJVL2P2i7WHZujKsTDPdGeLz2NLA-8PMOJxjeSQqy9UVO92K4
Message-ID: <CAP01T75Z0GjUPiKWCPU7isSMvA+1uMtYE2Nm-iQnvpjFxk0OUQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 11/26] rqspinlock: Add deadlock detection and recovery
To: Peter Zijlstra <peterz@infradead.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, 
	Waiman Long <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Barret Rhoden <brho@google.com>, Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>, 
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_221205_970221_F7C9507B 
X-CRM114-Status: GOOD (  10.27  )
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

On Mon, 10 Feb 2025 at 11:21, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Feb 06, 2025 at 02:54:19AM -0800, Kumar Kartikeya Dwivedi wrote:
> > +#define RES_NR_HELD 32
> > +
> > +struct rqspinlock_held {
> > +     int cnt;
> > +     void *locks[RES_NR_HELD];
> > +};
>
> That cnt field makes the whole thing overflow a cacheline boundary.
> Making it 31 makes it fit again.

Makes sense, I can make RES_NR_HELD 31, it doesn't matter too much.
That's one less cacheline to pull into the local CPU during remote CPU reads.

