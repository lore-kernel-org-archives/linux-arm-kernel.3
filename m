Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC20C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1JsTbuYyTle7+hpfqx6bojFNwRlWPSoyeI48cCNBA4=; b=KlnMZDd+dKuBTLq9I05X4HQOXX
	8uWyFW4duw7rVlmc/PyYBER5WdIIhQEd/hUVgZ5Z/AqJ/+/amE8CSp15l+ugpjy5G6yqotlDPNg4l
	Lvc/9SLhIBcjBryswaoXvXKUP++V0Vf/Lxv7C5kkPxssbCWta2fL4USZy0MnK0oFM/CZkVB8wUs35
	iDPRfvi74z/dlHs+4mZaBL1ke1DvM/9CpqRsDIrL1HeaCD1qWM2aiKPOxIUdE+2PQPldfZTywiDYu
	mJNRFWbCEzRntMIWdZjp2NBJCNyzf1LNVUJX6sYSz9SR7IoSrsIhZFy7IRb9QeiCLFsF+npe0Qrz+
	mZ25PElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9wl-00000006jX1-02fI;
	Tue, 24 Jun 2025 20:08:47 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8Hg-00000006VAf-1d49
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 18:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750789331; bh=e033+EOrm+ZQynE0f3rzefdqZBwm9MyxhSN1QecZt60=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eWj2z86e6QU2vGPgFshbKs+3wBYTgmLCJv72AR6PsONpdcNxSLV4JHCEu4Kh3f+Yj
	 LqPJU8tB/ZJ6PMq4Rluqp9b4rc+nTnqmNv4CycAufQ2cDJB1zpPaziaREmgYIK+INs
	 gTOWZZGeQTrIU3IYG1uxbjHX75wYh9mDJbaO1Gc0ofWqFt/pQUbxqpQf4T0VorqQAk
	 UTSzulknzcI4g8WxJTKrGb2fNHKR32X/fPcxVLAIEuB2OOuQa509KJSDE1Rhij4YI2
	 J0LN6mVGCq4Cg0AQ06/nPkYu2QBAxqmZrO7kwALnDEO2Nw/HdBNE+lHRHLFax6k0qd
	 sSf+S0Wdzksfg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id B9FBC3C427D;
	Tue, 24 Jun 2025 18:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750789331; bh=e033+EOrm+ZQynE0f3rzefdqZBwm9MyxhSN1QecZt60=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eWj2z86e6QU2vGPgFshbKs+3wBYTgmLCJv72AR6PsONpdcNxSLV4JHCEu4Kh3f+Yj
	 LqPJU8tB/ZJ6PMq4Rluqp9b4rc+nTnqmNv4CycAufQ2cDJB1zpPaziaREmgYIK+INs
	 gTOWZZGeQTrIU3IYG1uxbjHX75wYh9mDJbaO1Gc0ofWqFt/pQUbxqpQf4T0VorqQAk
	 UTSzulknzcI4g8WxJTKrGb2fNHKR32X/fPcxVLAIEuB2OOuQa509KJSDE1Rhij4YI2
	 J0LN6mVGCq4Cg0AQ06/nPkYu2QBAxqmZrO7kwALnDEO2Nw/HdBNE+lHRHLFax6k0qd
	 sSf+S0Wdzksfg==
Message-ID: <02d0b071-435e-4f72-ac57-40d883e5db27@mleia.com>
Date: Tue, 24 Jun 2025 21:22:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] pwm: lpc18xx-sct: Drop driver local locking
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-pwm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
References: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
 <4f7a2da37adbfe4743564245119045826d86eca6.1750788649.git.u.kleine-koenig@baylibre.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <4f7a2da37adbfe4743564245119045826d86eca6.1750788649.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250624_182211_774414_359A9DC3 
X-CRM114-Status: UNSURE (   5.45  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_182211_774414_359A9DC3 
X-CRM114-Status: UNSURE (   7.43  )
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

On 6/24/25 21:15, Uwe Kleine-König wrote:
> Both mutexes are only used in one function each. These functions are only
> called by the .apply() callback. As the .apply() calls are serialized by
> the core since commit 1cc2e1faafb3 ("pwm: Add more locking") the mutexes
> have no effect apart from runtime overhead. Drop them.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

Thank you for the change.

-- 
Best wishes,
Vladimir

