Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF1260716CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=067HjjMz;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqBsiQ1Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/d04P7S4R4uaa3tzPbK1YyRGjqH3Qefze+gmw7FCDXw=; b=067HjjMzGS4GGd
	/1Oqjc4jLQ+wtSJUG/9xQ6LCiY/KquC2ZHZOGZDpF4RpS7Lyo8Tl7UkrsHW/CC0I2uynpj2S0GQ1t
	xdS+bRUFLCsBld6FfpeJmQol6pBRkXMxojE76tmSg/Rrk7UA89LAZ9zI3gmi76QKb02g1HyTUzONf
	6ICQ04b9IRRww/YmGmZIW0v57gw7lGZqmoj8wVWGRJMqRJRTS1jr4z+8YmsBATJY57+icNp4SoO2I
	VDujFw4uicPXiJ1XIj9pKC1nnBDTizK+xqipfLuD+Oq5WGcMHffR6DNREkANy9378SjCXCHu07IN/
	vi0TL2P396mj8/sCo+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuiA-0000000HGdl-2mZS;
	Mon, 02 Nov 2026 16:16:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNui9-0000000HGdb-3inT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:16:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F21EB60233;
	Mon,  2 Nov 2026 16:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37A61F00A16;
	Mon,  2 Nov 2026 16:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793636200;
	bh=/d04P7S4R4uaa3tzPbK1YyRGjqH3Qefze+gmw7FCDXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kqBsiQ1QN6C3Vb4asC/cgub7kRSShib0CU07BdFzh9kqRijeGLE3yBjRX8K40f51v
	 JIHB00H3vViHslAlyEekWDDy0JnKksExBQcNmAgu+M7q0VeOSt++lYoBl2GQihBAbq
	 NorqKUjMHhaq3IKKGpLtV7dzDRfI3j8ELoMeM7Q4FjcLmpzx2l2LsebJ7UZSmgGDaI
	 URSH/XZKtYpiUask68RTD0zR7FyeudW3WentmA4PH5Z73lv0Vb4+lMgjezcqVvTj35
	 cyKt/bipZXEnH5OZA9dmtschflh7yNqxvzNUXIdZlt83z3m+8L5Hrn+wg61nYohGNU
	 IqU+PRKewHVeg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH] firmware: arm_scmi: Drop redundant ACPI configuration guard
Date: Mon,  2 Nov 2026 16:16:32 +0000
Message-ID: <179363613954.1025050.12993200940988359381.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026105510.1778073-1-sudeep.holla@kernel.org>
References: <20261026105510.1778073-1-sudeep.holla@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 26 Oct 2026 10:55:10 +0000, Sudeep Holla wrote:
> Commit 98b9bfb659a9 ("ACPI: bus: Use acpi/acpi_bus.h without
> CONFIG_ACPI") makes the ACPI bus helpers and their stubs available
> through linux/acpi.h for all configurations.
> 
> Drop the local CONFIG_ACPI conditional around scmi_acpi_device_hid().
> ACPI_COMPANION() returns NULL when ACPI is disabled, so the existing
> "unknown" fallback preserves the current behavior.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Drop redundant ACPI configuration guard
      https://git.kernel.org/sudeep.holla/c/7f73b4cb4b3a
-- 
Regards,
Sudeep


