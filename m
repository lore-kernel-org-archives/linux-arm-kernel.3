Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D61C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBMX+Dz0hWZn3u61TkOzdRuiBkDqYb9ZBGePVYRUeEQ=; b=1Gok4j7M08N8wlmq25zP3rzxWE
	05wDjNJRh3G78rUKoNQuIT6Qij4bvKntLe6xHTC9maXnxymaSB1zJkDAvhSVEjICiXUcQG/u6WOxd
	s2qe+MjtHSuC0gQkQMAgcKELPgR5HERWhOnThM7t/ehQpQWjcZVuQRbztTNiP1IMS+SDLWYBMojf4
	TcSpizJBg+H0N/QtywG2w2Rnt+cu2qCpGTmA4bWsnE8MH5cEPl2FJsCk1++mkjXWxcqv+MHGr80wH
	pvvl1YnfPyncNBuVtCcbruCn+XrQw0xsv+zFtyrWXbbE4QShCJNTP6PBaT0kkmB4lMDaTkuBVFn8u
	EaJvIWmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkQh-0000000D26B-3uCE;
	Wed, 04 Jun 2025 09:29:03 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkNH-0000000D1rt-0OjU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 09:25:32 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749029128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CBMX+Dz0hWZn3u61TkOzdRuiBkDqYb9ZBGePVYRUeEQ=;
	b=lv6FqFP85RWJPgGMKGEGoJ8fiGRsIIzMsw+C7cOmFYjjXtG04m4TEDQemXvE7cgRqsFXPd
	z9JmC21/h22ICKLDGvKbWODuvaDqs1n9z/wmi0MKitLwCrTJfTEK8Cw43K8HfBBSIqx9wh
	tdgflehM7qIrUvaSaUCiYk+xjd3buIE1rmUwM7VxmhxRXxwzqU1W7LouUzJ8HtQnbPt4Fk
	/ZR0KEJSqjZr+rcPyt2msUa9iKw4Ekmr+/WyajSXe4MayGDWAODKZuGRTaCBAPcxKsWR8r
	ebYighvkz1eHgXHDMZJFMMFF2aKbIigPm42zRd/JYfSUq5yvKHeQArPiweohMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749029128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CBMX+Dz0hWZn3u61TkOzdRuiBkDqYb9ZBGePVYRUeEQ=;
	b=c1OQwLBvCBk634Hl0YCxp3U/Cu3qvpqjvtecbJXF8ha8hIIihbmfAWiMhx8D+fuTdnN108
	EqoL8TGlJRCOImBw==
To: Daniel Lezcano <daniel.lezcano@linaro.org>, daniel.lezcano@linaro.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>, Will
 McVicker <willmcvicker@google.com>, Peter Griffin
 <peter.griffin@linaro.org>, Saravan Kanna <saravanak@google.com>
Subject: Re: [PATCH v1 7/7] time: Export symbol for sched_clock register
 function
In-Reply-To: <20250602151853.1942521-8-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-8-daniel.lezcano@linaro.org>
Date: Wed, 04 Jun 2025 11:25:27 +0200
Message-ID: <87wm9rq2ns.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_022531_275029_6A0991A2 
X-CRM114-Status: UNSURE (   4.97  )
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

On Mon, Jun 02 2025 at 17:18, Daniel Lezcano wrote:

$Subject:  s@time:@time/sched_clock:@

please

Other than that:

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

