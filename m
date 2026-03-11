Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3962112583A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 15:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1n477ll3uIr3ftc1SUKSWN3qMH5BQQpUlgTcrO/W9I=; b=TZRiYC4sAhMNgJzazZunQ2eJPq
	wOsG6tVDSWMg0/PNE7zvIMlfHtBnhUt9b3tTkNoaPHW4gUjlLuLSvPw1IecG5ABK8QXwzo5ObhU8T
	EQSiWUZpXG9+bbYlEC4vshSbBOhyi7ZM8xtMSnmJ+1wCqak6qZsTt7VDWwETEqizCeMqPsCz2ikl5
	aytPG3pfY8iKI8VwZ3O9NmjkV3xIrxNig5NRe3HfUqmnD1dCEE8vfrTc4KvZZLWvL6DChHlQMl0/D
	uKiTQhXoW9rsGM2Nn3iZdvoIwtVqJIifiQ5v1qsXTqXFfNBYnCxfdyQJwKunb9lHrmHFRLuHGfY6K
	r9QF2q+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LPM-0000000BoJD-0NVp;
	Wed, 11 Mar 2026 15:23:36 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LPJ-0000000BoFU-1KId
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 15:23:34 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-439b7c2788dso7715534f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 08:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773242610; x=1773847410; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M1n477ll3uIr3ftc1SUKSWN3qMH5BQQpUlgTcrO/W9I=;
        b=S4w4Zes/rc78YMCXI1sKgYbdZj26tWtwMr+RLQEgjafwk8QtgFQ1gd6IL4Q0dewQod
         urREMEbNqeAeq0uWaG3dQBK6BeoPmbCxZ5ijgUx1rmwXt2oFRCM3wgLb0AFkxogUdmyy
         xxGrKnmke7F+NXxfnLW6ttGuN/izGbBG8W040AL2maI+EANsTJ2xwnvqsARdnvUGGvui
         3CFvLEFmoN1t3rv3TXIGjkeCV5j537sJBB4bT2C/We+Pu7J9iccnnVSAz/kYjX//GbuK
         3NsN6Ytbo68zJzj+sQiB59VyQdnqqVl9lJsMZMuHSmJSkM7wc1znJqpsjSTIOaUNzvVy
         Wzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773242610; x=1773847410;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M1n477ll3uIr3ftc1SUKSWN3qMH5BQQpUlgTcrO/W9I=;
        b=JbuHKMA/IHbNPo2qXJPq423vIabaYVXvI7oIoSZ50opzGgKjMo51aDRKuNI0TSeTME
         0yGo3CaL0aC+pEa1cs/KH08WTkdC/DKiWXhAYi/Fbg/OKPSjsCtfXYCEt8nTmD/ksc2J
         UTdKkXSDFiTtULb7AqUW4WsElxjA0d4IusjpTC+TvTR23ZttvVP47P5XSBfZS5n/9W42
         /xiwkFWa6dDSqegN7pd9U/50t2I6WIa6fuEqSOdWHTuMsNRyHnzqZk6qUWZpY80V4O64
         PNTZ5onX4i9UbBbBN3sYLEON3rNJfRKj6lM08yB06KH9FidixxZ+fuZXDsLe2oHiQQob
         gIWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK19zGkE9Vm330GBAep2Wqv+a+cNTb9WNlICspCtTwjmIvdhWDhkjF7IE/jRnHXwUOMJmeiiCa3yFGH7lO+Eln@lists.infradead.org
X-Gm-Message-State: AOJu0YzsV/gGyic4V6ovnFYOEDNtI11JhnczQZ5/RGZqOirPY0ncuhzx
	LX2m8dLAfQr1+B0alqnJiY/WQ9DoAxgXwzQ8KcZGg5M6Mld9bPP2Ts9yAeJ2CsabdA==
X-Gm-Gg: ATEYQzxRVohPZtLkZHjyPm1Msy0oKavlczRukSWKAVgBXehFITXtGR5i8uNxUZQvcIr
	5SskiR3w0T7gkHjyXXaXgAYcW33/U6sQOJPBr+/syxIM8s3UaHzJefifyyPIoXCJjIe0oNDyRiJ
	lBejHTwbNxXF8yItT8qu4h0DD1Yqs2gA9YPH4v84vZoay2PT6VsgGtUfsQXjyAhKkAGNJnG/3pg
	5diKqKJiqVMPdTm9FsX+GA8lO98z68TDGF1NRS6PyNVN13D7wNpTsgTiNymnAUjFHX2L6RtY5JX
	Jlv3i5aZLmxk5HVQmsELQqGZ/bD6nj1xM6PQfOFItga9kUpi/OiUo7VtwKSSDoee92CI9bmCNtV
	8s52QgsvbJeEDB5wIwc2NLwLcJW4PgilgnjyFwTbYlnF1Mjq6GK7sLfYFmAUX4iz7VvEXEB1SXo
	zNEhp0xpELKq9IRLTE4snEJW6GyMqZG4BN+Dl1AVaffDOXwFGqeEOLXMW3MO0l9qUsxIY=
X-Received: by 2002:a5d:5d85:0:b0:439:b715:6f49 with SMTP id ffacd0b85a97d-439f8415ffdmr5618431f8f.59.1773242610090;
        Wed, 11 Mar 2026 08:23:30 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f82078a1sm9543853f8f.29.2026.03.11.08.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 08:23:29 -0700 (PDT)
Date: Wed, 11 Mar 2026 15:23:26 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-trace-kernel@vger.kernel.org, kernel-team@android.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suzuki Poulouse <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	John Stultz <jstultz@google.com>,
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v13 03/32] ring-buffer: Introduce ring-buffer remotes
Message-ID: <abGI7kzhTHl-MyHv@google.com>
References: <20260306143536.339777-4-vdonnefort@google.com>
 <677c7ad6-6e67-4011-b2d0-03d0d58547ce@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <677c7ad6-6e67-4011-b2d0-03d0d58547ce@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_082333_401451_123D6A4D 
X-CRM114-Status: GOOD (  16.16  )
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

On Fri, Mar 06, 2026 at 05:37:35PM +0100, Markus Elfring wrote:
> …
> > It is expected from the remote to keep the meta-page updated.
> 
> See also once more:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v7.0-rc2#n94
> 
> 
> …
> > +++ b/kernel/trace/ring_buffer.c
> …
> > +int ring_buffer_poll_remote(struct trace_buffer *buffer, int cpu)
> > +{
> …
> > +	cpus_read_lock();
> > +
> > +	/*
> > +	 * Make sure all the ring buffers are up to date before we start reading
> > +	 * them.
> > +	 */
> > +	for_each_buffer_cpu(buffer, cpu) {
> …
> > +	}
> > +
> > +	cpus_read_unlock();
> > +
> > +	return 0;
> > +}
> …
> 
> How do you think about to use another lock guard here?
> https://elixir.bootlin.com/linux/v7.0-rc1/source/include/linux/cpuhplock.h#L48

Sorry, I forgot to reply to you. I had to respin a new version so I have made
the changes you've suggested.

Thanks,
Vincent

> 
> Regards,
> Markus

