Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31DBC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 07:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEZZ7jCpPzgYTO9oedvXx8uW0QuKMwnxpLd54iUvN+g=; b=MUzRQsE0l16iD0MxX2qJJQttLH
	I+8lfK+m3apNxCqWHXGWzAVDTpuUJxAzNp8c0zrNgcXsf5DSCtRCxW959VQBVDtWxCsHUKCebsyyV
	xXK423+czlFia4tPLPQ5d1vGTO9KXe46zBTZhxcCvfCxBSq9bhCMryp9Mk5Uubz0XkKSOwU3/QrIt
	/1KSbNNJyztnadxsetx+Y4X2No7vwbS9Az8dQRsjZFsuY65nHhjcqEh5o0qjJLKelFDyyrIlLbmC9
	QtcwfJZiKRZIjli/dalbukhISRD5oJiX38Yc856AAld0jnzFwk7tSun2h/7LwiLBZ5jn1HTlatCoA
	tF2Iusag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaq9-00000009D5Q-23B6;
	Wed, 19 Aug 2026 07:36:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaq1-00000009D2I-0HBK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 07:35:56 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4956d1d9fb2so695425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 00:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787124951; x=1787729751; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EEZZ7jCpPzgYTO9oedvXx8uW0QuKMwnxpLd54iUvN+g=;
        b=sOoEtqz9FydVu3obowpKf2q6ABnnSaStxifqw1LXMObAFHo8/hvl48zRK1dI7886Kc
         hBxUAzD1yUnpxDCpMoQ+8ibzq1sh6HStcxd7dlcxebQkUmQk6xdrZB0N9jjV/RCQFNtx
         //GsuCYENVoRn3UKWnXlGBinz7qJc9gHJDNuDsOz8dMwYSfEUVmRS3hzSelMic+w6Vpg
         mYO2ZzkCK4PacjbOPRqlZ5Zx5vfUrgbpeh2f75/UFbv0xprV78UT7Wiq4zNsKvQafhqw
         i/WzoukcqY1PGTRWBDbmUyz2xyps3rFdAbFW4bV6voEFoAsjsamzZdKqoqZwqowKl8h4
         hZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787124951; x=1787729751;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EEZZ7jCpPzgYTO9oedvXx8uW0QuKMwnxpLd54iUvN+g=;
        b=H2+rcJDg0QV+s/jgp17Dll0fZzXm/50CuU/sAMGjP+YFupCMPLhHZ+dlQGJYNP7jwF
         zg7/NdexaycfBkgni2eKpJUYKS+FDzW8X+ZdyiwLAEiRl/KxyYH2FEqCj31Z6r0ypAUu
         Em8YwhRvzo4g/J/lk9XUmkdlk+8UiPCLwXTIDg19bCV8PUtYPu0lzecu1uChrFdEfsEz
         V55ShSgKGIRA/4K25qQa22cBWeTdikGZT7RE8WeUeYb+RzAN+UOjMK0XNghYV2PgyGom
         RQiGpDpmi129JnmCcdY7VPYpFrY/Y4tGP9pGesqdutIZjdD4h8qMih0WUXI8HE0kphVv
         VqTg==
X-Forwarded-Encrypted: i=1; AHgh+RqdY+ApgVrrjx9tbwJhB07Sn8Tk5WEd699NcPbEHncWKvZKSh1PBsmjNLndawjEmcVKit57n4+jkryjv+dIqEx1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8UjLLr6aACCrrBlbDeg7QCdXFLp1Mk3XQmNtjWqLzNRB9Nt2O
	6VT+qYydpW6hmdxg8orls5iZazOw4PHgOVX9trH6rBa1ZUQ2AWGVZiWD
X-Gm-Gg: AR+sD13aofxOGZQO2fTCbElw5Wl5S13+plX5XYgVu6vl6Nq74F5Y7NLShHQc5kWXz/n
	RauOIUwxH65w4AjDT71mOdrLy+A+Byc3jya02dh8rxqknTLbJ3gShBTPEU7iDjlkNsUYx1lja0P
	+c681Wf4MFcMJyJdphr+rN6LhNTo14/7qPlpTOvI1b/t6w8vHTIV2Q+wFCIPsXmtaQug733aFBK
	A7UED8m05HWgV7nUoeEm0onKUqAby781AtvZNyflP1660HU7BaTEd2YjgI7Sq9QH40r67cReke8
	+lsii7lbhHBR/kkbYECL3U+0CHzjlHrpVKH4aQhl3Fyu19lvascbdxHrTStAZjxRaqil8Wiu4wZ
	tDEWOcEApHsq6DDSZXT/lwW5XSlWMfvL3A+Hq2nwIQGXvJ/WLGBND8ZCz6EzbsDOuxIuqFqcz/0
	nDL66uhlss9iOcYkU01hNal6XnI8K2hhg5EMsqTrmbgFI610HfOsNcQRrllbcV3oK5HXz2YYYDI
	Bj8gXB69PRGrB10YPFN2tzfqN1Ci4dFhSDGXkMmPbf6v3t3zpbnEOCdAJazD2BG9WaA3w==
X-Received: by 2002:a05:600c:6206:b0:495:71ff:598d with SMTP id 5b1f17b1804b1-499aa1997d8mr24560625e9.1.1787124950666;
        Wed, 19 Aug 2026 00:35:50 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B92960062A31D8DDD4EA0DC.dsl.pool.telekom.hu. [2001:4c4e:1b92:9600:62a3:1d8d:dd4e:a0dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0dd3c9sm40653805e9.12.2026.08.19.00.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 00:35:50 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 02/12] accel/rocket: wait for a running IRQ handler before resetting a core
Date: Wed, 19 Aug 2026 09:35:27 +0200
Message-ID: <20260819073530.6087-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819072420.1780708-1-gahing@gahingwoo.com>
References: <20260817113603.1436067-1-gahing@gahingwoo.com> <20260817113603.1436067-3-gahing@gahingwoo.com> <20260819013609.1613919-1-gahing@gahingwoo.com> <20260819065146.5904-1-royalnet026@gmail.com> <20260819072420.1780708-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_003553_184636_1CDDF23F 
X-CRM114-Status: GOOD (  14.44  )
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

Hi Jiaxing,

The three-run design with the deterministic third arm is exactly the
de-confounding you promised, and declaring the fourth run void instead
of letting it pad the table is the kind of honesty that makes the rest
easy to trust. Glad the third bullet closed on silicon - one line, as
you say - and thank you for the Reported-by.

Meanwhile the differential finished here. The base build existed as a
pair with the patched one from the start, so this is the same machine,
same morning, same session.

Base kernel: identical tree and config, same JOB_TIMEOUT_MS=2 local
patch, with 1/12 and 2/12 not applied. Same protocol, two passes per
kernel at console_loglevel 8 and 4:

              loglevel 8   loglevel 4   recovery   oracle
  with 1+2/12     12            8        all clean  48/48 both passes
  without         12           13        all clean  48/48 both passes

Zero MMU_DTE_ADDR, zero "Error during raw reset", zero lockdep or
atomic-sleep hits on either kernel; the domain dropped and all three
cores returned to runtime-suspended between rounds on both.

Your distinction between the two tests deserves my numbers next to it:
all 45 of my resets hit a healthy block crossing a 2 ms timeout, and
the domain dropped every single time, on both kernels. Whether a
genuinely hung block would keep an RK3588 domain up the way your
failing runs stay up on RK3576, this protocol cannot say - I do not
yet know how to manufacture a real hang deliberately. So the honest
summary of that difference: the step your failing runs are missing
simply never goes missing here under my conditions, and I cannot
reproduce yours.

The race itself did not manifest in the 45 resets on either kernel.
Timeouts are easy to induce; a completion racing the reset inside a
microseconds-wide window is not, so the justification for the pair
remains the source analysis. The tag attests what was actually tested:
recovery and absence of regressions on the patched kernel, against a
differential base.

For 1/12 my v7 Tested-by carries to the v8 shape as re-run here. For
2/12:

Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, three cores,
                                                 # induced reset, differential
                                                 # base, JOB_TIMEOUT_MS=2

I understand the v9 sync patch will carry the interrupt mask and so
change shape; the harness here is standing, so say the word when v9 is
posted and I will re-run the protocol on it as-is.

Regards,
Igor

