Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45829606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4SCQFI9z;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fWfUia+b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WWMGndPAPi/9UPLdPzs/eClP3b+MIDrQWGzMEfhXf+0=; b=4SCQFI9zL03W06
	0w8p7W2YQyx8qEs0HWTMAvxJ2f5J9En7TbnQ5V3ozlMI0OnsaE5iNhi6TKFtQbljg8nDLJs3ClHIT
	VgX8sslq/FXQWt4ltJFk9ZpILJYWRK0U6ZzDAUDPd2ykrFt0XOJr6dMvrtKPl/1+vg9aOQ6UQyNGt
	GEwRQb2G2wo4lPx8XNkFwqFol8Z0UmjnNYWgmnou6+cQh5QPg4BWiKgIqTqoYPRiSHhZHlwY2zgQw
	GYWkOFvfb4S1sLUoKycUXKHWwAox9hYneIRur4DxASQ7mVfg9cXRhMndX8aE8YBmkCYMlrFnArErJ
	0YsMgzLH3dreTCqaY4XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNs8H-0000000GcG2-0K1T;
	Mon, 02 Nov 2026 13:31:29 +0000
Received: from out-201.mta1.migadu.com ([2001:41d0:203:375::c9] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNs8E-0000000GcF6-1RJR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:31:27 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=tyuUU3tex6yGuGsqkMIA7zBej2IJkvxByg23hzKT+6k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793626284; v=1; x=1794231084;
 b=fWfUia+bn78oXS6xaZceLZFGdj2BUs/KRC9uhgCV4jRuhku0GRK9Djp5dGvPEC4qK8aCbsTI
 L/YK+zh4u6+MJwvDK4WvN2vvMtRPGgPJKjdEkCNZhSKI/lWMPX6xe4zS8TW7HzgURgEmJZsFtXg
 h/mouv1NXRAM8A4QRgHhMVjo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cfaa51096a2fcffc;
	Mon, 02 Nov 2026 13:31:24 +0000
X-Mizu-Trace-ID: cfaa51096a2fcffc
X-Migadu-Flow: FLOW_OUT
Message-ID: <b88e357a-819e-4f82-a6ea-00dab9b7f232@linux.dev>
Date: Mon, 2 Nov 2026 13:31:23 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/14] drm/tidss: oldi: Move the setup of one OLDI TX
 to its own function
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
 <20261029-beagley-ai-display-v4-10-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-10-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_053126_530197_62419520 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 29/10/26 10:18, Tomi Valkeinen wrote:
> tidss_oldi_init() sets up each OLDI TX inside its loop over the OLDI TX
> nodes, which is not a few lines of code and indents quite deeply. Clean
> up the code by separating the setup of a single OLDI TX into its own
> function.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya


