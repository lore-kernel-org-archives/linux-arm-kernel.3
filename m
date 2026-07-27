Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91478C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5fgYYcv97X3cmNAX0LPuBoe0o+iYp8x776W/oEnHq4=; b=PiX4j5rkoQtahFWv6hl4hZTgsn
	KmxE3CVjWoMbIHnilJvlfR/SyMOyYsjl6dZaGIso3GUPSB778U9s17xSibD6wmoJqrNrkbjYCTcj1
	Ke6vDgEt+3yP6jIQk66iPqtAO3B1xcNANNx7l+q3Z1zwYtYFQi6hCDNdPISwC408rrfqrwRYH8Cni
	3ruRw3uMJNOCJmU9yq6JT3wIHKDZuv/n11ZFTdBTlbAmyESjN5XzR+RGNMpX+VShQ+pL6ekyQw2Fi
	1uZaQwRUMA336vaD+q0XHZ8a299OkNkiD7PmiRqlPqJZzpc/nC6mNVh6UU4lpsIyG53aOr5/Psrf6
	TYT8u5vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRWS-00000003nlk-0DKm;
	Mon, 27 Jul 2026 20:02:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRWQ-00000003nlc-1ue1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:01:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 47AA641160;
	Mon, 27 Jul 2026 20:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15A81F000E9;
	Mon, 27 Jul 2026 20:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785182517;
	bh=E5fgYYcv97X3cmNAX0LPuBoe0o+iYp8x776W/oEnHq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bz3g3Pc9CCjO7t0a/ai27As//iRoXOFna0d6uiBsr0LbGLhzsMDFOnZ6gyUdtzfle
	 ji1NSWkob04wed2uU0StlIB47TVKmRdU1bvu9+kldRtqF79wSnDzfE/3oMvn3ltAbM
	 tZ9Pul7Uh/vHiilQgDIPpBnYGh8vzZhAqP6qc7xsX5nRwkWim00fx3exTOnYFR+I5z
	 5lbvbNxkN38WJcYVgkH9HdJMOG01kZPIJKvtRNA2E/DQ0B6jfe9xYqW8rsw7G+6otL
	 BHSeNVLTh3HqAn+LOua8sJrxFHCqZNcT79rO2AaoabfQwuQULNhMMqPhmtoDj4l5NT
	 J+B6s7jZPmS8w==
Date: Mon, 27 Jul 2026 21:01:53 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Xixin Liu <liuxixin@kylinos.cn>
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] clk: scpi: bound-check DVFS index in
 scpi_dvfs_recalc_rate
Message-ID: <20260727-generous-cautious-vole-829acd@sudeepholla>
References: <cover.1785118770.git.liuxixin@kylinos.cn>
 <aa54a3b63064.1785118770.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa54a3b63064.1785118770.git.liuxixin@kylinos.cn>
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

On Mon, Jul 27, 2026 at 10:19:15AM +0800, Xixin Liu wrote:
> dvfs_get_idx() may return an out-of-range index if the SCP firmware is
> buggy or returns a stale value. Only negative indexes were rejected, so a
> large index walked past info->opps and could treat garbage as a clock rate
> (KASAN OOB / wrong frequency to consumers).
> 
> Treat indexes >= opp count as invalid and return 0, same as idx < 0.
> 

Again this issue of out-of-bounds read is in the original SCPI clock driver.
So include the below fixes tag:

Fixes: cd52c2a4b5c4 ("clk: add support for clocks provided by SCP(System Control Processor)")

-- 
Regards,
Sudeep

