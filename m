Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65307C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkRksZeZRdJUhfD+fysrVUZxN07ubnU6SAGQQ5LsnD4=; b=U8RSMFkZqXLYcYxEDElJgsQ1qH
	I/e3eErVFMiWIpBzEoX8TbOPDKbRZBu8PXB0jVjDpWlX0Tv5bV1eI2MJmshVmuA0TWCv/6canbBER
	x3Ra0TkLqO8rKc5OUXlqJDWjyG1YgMPRzf5t/mSZ34N5kzbkaLTZkZGgQzkNw5MvWTaqTcc0Q1l/W
	a2UI1p1XQsdy2zTEgWmJupzaQSgfvbGEhzBoz3edSSTFl7YgsPm9olURKWYNSpy/vw3o5GcOpVRQC
	99C1AjXaCzzxaAL83c1FMfnFpJYa27mwlsjDFivazLDOXmWENBzUfwmGYD3X0wI8M+rdceuxn86w/
	TtYEsJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOi8-0000000EenA-2ieS;
	Mon, 28 Jul 2025 14:20:16 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOcA-0000000Edda-0HgK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 14:14:07 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-74b54af901bso2878390b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 07:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753712045; x=1754316845; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VkRksZeZRdJUhfD+fysrVUZxN07ubnU6SAGQQ5LsnD4=;
        b=PHyjBej/nY1pgv4vLgTXw0xKvpXaSZX3t5pRMXTGe62ieJ093AvgrjteC7uMe7nuUd
         66OFq+sXOB6Pgsmk4AtHlMC/mEsxyT5lufIyjTioTvMR6XHg9AL9XCBTgjEUTI7954EC
         oiY2ti3GbGMHxm7U2aMF2bblutzmEQf7B12p0lEtRnSyps+w/JdwjJf0jZZHDH6gTEqQ
         Rds6ce8WP6HaDIqzqxmlzlaBqAXFYlN380uDGY90LYmSvHAtz+2LfvMXG7sr+9dEPdmd
         U3ADfEbTkx8mBCrUwDAyxNQeMpaFqalYVfL00A95g/MN7tOQ8FSnjMcZ3QzfoLD5yZem
         xuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712045; x=1754316845;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkRksZeZRdJUhfD+fysrVUZxN07ubnU6SAGQQ5LsnD4=;
        b=Dwl2sYnW8vB+hDvSwgEc5caR6M4kjInbHlbRgXleDfGKIoSnQJimOlSuG2vpD8ss7f
         Mny6CtH3wF9nQUSXMYRX0W+vdqjdCVHzvHSmQi5dRVDYzxaw4EqDNvOMlR7kdaNOWgjn
         PZjgW9ebSEgeOCLq8Vo4SUqgn5QtIl+z7cRpAkc3+vhTl8KilEfdA+O4r3TinDpkvOa5
         20ov+5RWRENVkrOzezdbxME/1NdGb/moiuQ+xVBtk6L6kkf2JstuxDu3Vw7VeRWfPGf5
         J3M6Q1NO0i1QI3T7NS0MH1msEGUuKzRfQ4SlLvA05q4YkidWV6JbAgvgLyyrGbmZ5q/q
         yqYA==
X-Forwarded-Encrypted: i=1; AJvYcCUIM5/MZQycfo3Br4SsMUjc8+UyuvzER/ipKoyeP+SfST8KkkyWZBTuKJDwR8GndqXP43TNNiX3ZZurLC8fVU2v@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo04MC75PFfkCt8jI0MNYoLZ4fvoBQO4YgtwzIgirlEKiVFq48
	Q/2COZNcUfa9804P5C8aOYaXMbinkaEXVaZPD6kirBvzn+aDd5eoe4hgBbFLg1HLLiE=
X-Gm-Gg: ASbGnct8AdceI4i9xIoZf6A7GkYAqghv/rijmBYPw4GDBExrKWBkx6v+xWY3MBcRaZE
	HWCuoiKRxOI9VxioIAzY8BukkDCDXgda3Rrxtiv6MV+HkGsc3WKphhq0Zo+8D6gWJPpLr3vcGdl
	oSvK0d8H9Oqo/dr2/7W0XuNptyg4tk3+kO8l60H/vVnSvOwSv8t6bjpK165IaezBC8ICK8/IrDC
	F6MNG65tq8khRjN/D0nGtbFampmGQqcjU3pC+GEmWjw0lV5r9IA4joKgHS3o8HjMlUxKUCZMwCh
	cB8JWiP3YtWAsECw1kx5lZQ59PtWHOQENVubZluPQM0+JL3YTdLQwsrvbiJabq7okjI9H+d4QDa
	dDIORBnyUJapxArq7sFPckMtvOAZJtHIsRgav
X-Google-Smtp-Source: AGHT+IEzYHk+WznmPpX9Fulm4uS2KRvmZT0lrK8OW5a60R5q4nnqwgfy/r5C+L542XQYKAZbclCwBg==
X-Received: by 2002:a05:6a21:3d95:b0:23d:ac50:3342 with SMTP id adf61e73a8af0-23dac5033femr345980637.38.1753712044666;
        Mon, 28 Jul 2025 07:14:04 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:82ce:5506:d365:5bcb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76419d84234sm5604059b3a.57.2025.07.28.07.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 07:14:03 -0700 (PDT)
Date: Mon, 28 Jul 2025 08:14:01 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support of recovery
 and coredump process
Message-ID: <aIeFqVUp2C6fh4PT@p14s>
References: <20250722075225.544319-1-shengjiu.wang@nxp.com>
 <CAEnQRZBc2X6Yn0X+RbJ9-OSxovnHvoqJ3NXsJKBkuH82GNSAHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZBc2X6Yn0X+RbJ9-OSxovnHvoqJ3NXsJKBkuH82GNSAHA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_071406_103773_3B035358 
X-CRM114-Status: GOOD (  18.00  )
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

On Mon, Jul 28, 2025 at 01:39:38PM +0300, Daniel Baluta wrote:
> On Tue, Jul 22, 2025 at 11:16 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> >
> > When enabled FW recovery, but is broken because software reset is missed
> > in this recovery flow. So move software reset from
> > imx_dsp_runtime_resume() to .load() and clear memory before loading
> > firmware to make recovery work.
> >
> > Add call rproc_coredump_set_elf_info() to initialize the elf info for
> > coredump, otherwise coredump will report error "ELF class is not set".
> >
> > Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Changes looks good to me:
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> 
> I've tested it with Zephyr synchronization samples inducing a crash
> via debugfs interface. App
> can recover correctly.

Very good - I will merge this around 6.17-rc2 when I get back from vacation.

Mathieu

