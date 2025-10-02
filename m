Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C69CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 07:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvl3z3hZ0UdCWqyyeVvJf0liJiETPQAz95dvxxN9oyw=; b=sYq1iEOA/T+pMmtsucuWh+1VSC
	nlO13XYSKosXiqlSGhof9UYWBsMYSXNmDkeed6dO7Nmki9Xf8+ntwI3uorQv4nyk9LSGDlGgWewPe
	0Qw5twMFy5ByUMyM/Otbc25a3o9j1L3lClBq4rG7/bxQwXv+j5lC7DyS6Vnmm+XCFw9rQFBYvX2wE
	D6RVYZKX7NKysaazNpDHHyEhSaIai+qvfoRrgpFjl0YQmuFacQV8yh71bCJHsLS6EElj7n2z7w+R5
	5Qp2l+NV5ycp+rvXCJM6p8/FJejajbChX0t4/jFeSFvOA5+1G7Prp3IFOhxOJcNqazB585QZXL42f
	fFh1+JCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4DzP-00000009oTl-2N0N;
	Thu, 02 Oct 2025 07:44:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4DzL-00000009oT4-3Zfo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 07:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759391069;
	bh=744QVoJ7dfQabamJOCeDrnH9qRWpL6zFPcLc5xF5yik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eUDbntwe1xa6hiTHUNzeaKlans/S/GFpvMagRZiQiJ75x7aWU1heM0UQDe0K89yzg
	 +ZTlKYDrkdiN8iXRLHrQxMJPuW3srUTkQ5E5JnUR7tMjW7Bj8dC63AKeZ7KkHzDuJj
	 fbscVDgUe9Z+5qYS8rpTh73GTHlIfQKOgh6t+/kWuGsBrxTfLAiRx3zOTrROZkgwfx
	 +BSTfd60AuEj6ELtceY0McpHsHJ471gOj8FZWrNcgpVR7DE52pE3lmeh4MelD7t6eM
	 Is3sZr2ojnuBzOxCp//yb243MxPhpPlTqtGqhxh9g5HC3XVSJ+Y4QVFZUb723zZMP1
	 yTcu/gW1NIf8w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 535C617E0AC3;
	Thu,  2 Oct 2025 09:44:29 +0200 (CEST)
Message-ID: <bcfb637a-79bb-42d8-a2b9-508a2fab6025@collabora.com>
Date: Thu, 2 Oct 2025 09:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/13] spi: airoha: buffer must be 0xff-ed before
 writing
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
 Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20251001222347.3386506-1-mikhail.kshevetskiy@iopsys.eu>
 <20251001222347.3386506-14-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251001222347.3386506-14-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_004432_055194_91E2B717 
X-CRM114-Status: UNSURE (   6.93  )
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

Il 02/10/25 00:23, Mikhail Kshevetskiy ha scritto:
> During writing, the entire flash page (including OOB) will be updated
> with the values from the temporary buffer, so we need to fill the
> untouched areas of the buffer with 0xff value to prevent accidental
> data overwriting.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



