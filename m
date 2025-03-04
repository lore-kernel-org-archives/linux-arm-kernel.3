Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8F6C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAYlIekbsytWpG//ym3d1mjAZ0z0kh8QARPEq9BqGjs=; b=uFc9Woxgz9mqxdFPPxJ3dW29da
	zr3P4BrOHMmpXxA/udQOb2/Vl9ixl4sV5ptDmxUbN7BeUkcNLfOKO970Up9loxu4yvi6p1TUk2rqC
	7GuHxpAqV8uVkLaD8BowJ4Xu8P1ZOq0gkqvPJ44g3rOPIipwUxJ4ZSWHEOOynkCRL36ux/wHsDlq3
	o3erH6R1WU3WKqa610k/x8JrnS33epDs3AyNMbvoHKSSkqBzPiKk33WLLKEsHqSlDmyGtDDOm9Lwu
	H1+nERiElxpGSfMMsDNHbFlETZhg22EIJJ7WIZa1H4VbXIYoWkSJVU6v12ISISE+Hb7COniq23Y7G
	73og9fZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLQB-00000003BUB-0oLX;
	Tue, 04 Mar 2025 06:06:27 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLO6-00000003BJ3-0BzX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:04:19 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-223a0da61easo113425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 22:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741068256; x=1741673056; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sAYlIekbsytWpG//ym3d1mjAZ0z0kh8QARPEq9BqGjs=;
        b=sBE205O8cCZvDoG08CPV49B4FSEpLz2q8Mm1FAYbWQMNKD1WTWlX87DzSwQlqtSVhJ
         AtzUvzwHZacaHsTphvosGPG5eqLFMTA6QkDEl6s/eDLwIheDdr0r6poiQNvuCc4jvev3
         oGFrZPh3u14WC3jAhGP++2w0eleR/u1KdauQkBuhK60tQmdJZyecmCFCKXmBQ4/iI5Xu
         EjbXz4XbQIAhYHjOqY8G4Tq66QPwZMuLPd4BTc3gmuEyfEGvav2IWJLJdp8uYnr5Y+QS
         qo0m3h5JDfllMgvxV38pTNaxYJDYYBjpYxrKvNDWd1E30NVuv6kThcL6IO5QLjbN3IuR
         lx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741068256; x=1741673056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAYlIekbsytWpG//ym3d1mjAZ0z0kh8QARPEq9BqGjs=;
        b=P5pYqt9sx9yhnByGK+afLuREeEYtwRNimMPK5YjqqzVR6/v+ZJQTqN3IWvEXajVWmm
         AHnxEshrDW8lEkr/j8uL4Vy9imH1SCD5hQElvdreTP+tPd7Voy79fGMSvyPSUKBCkkxc
         Nr0VkBPkqlkgqbmn/mO9Eurqt6iY7BdgwXn+UgAczjCcLQz8633GK4sE114JetH+LLH2
         fIjR4OB1A5X4WV4Ff4D52K3vGQ2hkNRiBUUpJNSCzRTMw1g+rr/Rc52OMjE1eUtRWnJM
         w7wASwem0FNKymTDtkhB0HvToo4PglfO7JB5w5G/6LHbm4deRvLA7o90eeGjEDqezNyr
         T7nA==
X-Forwarded-Encrypted: i=1; AJvYcCWrMecwcjKwq8XwmB5w8nmUs+eRxVzfL9ZBS5DsJ3NPbIIBMv4vW7FmG9uZc5opCo12RPbH+Je/PwkaBlH/UdRs@lists.infradead.org
X-Gm-Message-State: AOJu0YzJwXBDxybMwJ0QR3lrN4t9cMBo2J2Zk5K7aOEXnAaRcbZcoVdH
	IXtjuDGnwRYPYVEW+erIxLyZleuINDWCGCTORjZZ4QWFfQzlRw08EmrBhk6PWQ==
X-Gm-Gg: ASbGncv7djqrB9GbnnqWl4dtmRc2XdA5xLJgZU+NOHsk90qqodPm7VNWBaiFIc4GgZd
	smZdMfMRdDjTyaM4I4WirPDDH7hM11ds2bY8hQDG5A7imMn/GiF/BG5FBDukrWX9lCeCsEhXCIw
	XlSNQbcMkcv7BwKnqwLzdNth5hIZaKbY+fIBI4Y4/yWXJWvyC2rM+teTbECKK48Z+tzzplWDguD
	XJoRvtatlk9CHF7SI26D0JViwGXS5Vg2ekPLxIAixSQZGUbToSlN5o2GcySKRnpk3TkiGGySCDx
	7CLtTdyKoa9uIWns6OctF83rok2lr5ZYycMRysDlhV8q/V8UdF5POeOfMXvFOTnjB33WSmxGRe2
	342yI74I=
X-Google-Smtp-Source: AGHT+IHqKnibT1s5HFFAINhOUWrBIEJxBR8aCf+9habHUqIWadTtSdR+nmlVUa1RzzG2S+S6SNMC4A==
X-Received: by 2002:a17:903:2b10:b0:21d:dba1:dd72 with SMTP id d9443c01a7336-223db3fe05cmr1287665ad.15.1741068256111;
        Mon, 03 Mar 2025 22:04:16 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7363a0f88bfsm5510505b3a.24.2025.03.03.22.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 22:04:15 -0800 (PST)
Date: Tue, 4 Mar 2025 06:04:10 +0000
From: Peilin Ye <yepeilin@google.com>
To: patchwork-bot+netdevbpf@kernel.org
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bpf@ietf.org,
	ast@kernel.org, xukuohai@huaweicloud.com, eddyz87@gmail.com,
	void@manifault.com, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
	haoluo@google.com, jolsa@kernel.org, corbet@lwn.net,
	paulmck@kernel.org, puranjay@kernel.org, iii@linux.ibm.com,
	hca@linux.ibm.com, gor@linux.ibm.com, catalin.marinas@arm.com,
	will@kernel.org, qmo@kernel.org, mykolal@fb.com, shuah@kernel.org,
	ihor.solodrai@linux.dev, longyingchi24s@ict.ac.cn,
	joshdon@google.com, brho@google.com, neelnatu@google.com,
	bsegall@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v6 0/6] Introduce load-acquire and store-release
 BPF instructions
Message-ID: <Z8aX2j2WYd4DlnCH@google.com>
References: <cover.1741049567.git.yepeilin@google.com>
 <174106503648.3866937.5658954004964289425.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174106503648.3866937.5658954004964289425.git-patchwork-notify@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_220418_083613_9535737F 
X-CRM114-Status: UNSURE (   8.45  )
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

On Tue, Mar 04, 2025 at 05:10:36AM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This series was applied to bpf/bpf-next.git (master)

Thanks again to everyone for reviewing this!

Cheers,
Peilin Ye


