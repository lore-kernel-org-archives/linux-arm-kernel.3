Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FC3606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dd/gKNom;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=QL4hSh4u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=73xKAjxZ/iUfedvukKH4tAcujSRHdTqC2mzu9O7dGao=; b=Dd/gKNomoe6J2V
	LvqVfdI0SevqJKFc0JBMyLgiQeWpcbtvkiu91Q9/aD+f0ZC+slEzuO7NkmaTSYSm9OEfIMJfaOVpl
	cLj9qRAKHyGEB1mixJ+bkBp2S80eZdS1DM/TpnyWkxqHrSYTKAiucQ/SIfMDJIwvV1rf6G3LBt7FW
	Kzsznvu9sBnfIuUb5H7u5+MrIjCyr3gQlArN+NHigNkkrFW+u/xxjnXzkLQ/WxTKN8s3JPIjtwwK9
	PYCoChXnoWLB7OwiMcWJp979zPzDxzj+f9FDCoZA0vYdRQN4fR+rn0o4gUdtJlHevpQx+4FeMDUCA
	GiWwHtmrRDXhmoOaGy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqNn-0000000GMvC-0c8q;
	Mon, 02 Nov 2026 11:39:23 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqNk-0000000GMuW-1PyJ;
	Mon, 02 Nov 2026 11:39:22 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2C12BE;
	Mon,  2 Nov 2026 12:30:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793619034;
	bh=6IEb5JlEa93A/QwCVBaWw1bfumGLwlpduvEDjIOXKDw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QL4hSh4u5MjmKA6IPEaetV2TRD1Bfz/fu29kHrH3Ei57lI8ZR9BTEyvi3QBOI5cro
	 zyGHnOrJEI36SLW576iOUArg8EemlycCY9cZY9vD4XDBUEj3taOoBM0Uh0okeAX6Fn
	 gQ3R2ZpdYDvnNb2RvJAlqUspZII2kFZDrwwHX8aE=
Message-ID: <b3a85767-9cf5-4e28-a6a0-b6695e63601b@ideasonboard.com>
Date: Mon, 2 Nov 2026 13:32:46 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: rp1-cfe: Use IS_ERR() check for
 media_entity_remote_source_pad_unique()
To: Ingyu Jang <ingyujang25@korea.ac.kr>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
 <20261101132422.1396104-1-ingyujang25@korea.ac.kr>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20261101132422.1396104-1-ingyujang25@korea.ac.kr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_033920_529524_7432C32A 
X-CRM114-Status: UNSURE (   8.83  )
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

Hi,

On 01/11/2026 15:24, Ingyu Jang wrote:
> media_entity_remote_source_pad_unique() returns either a valid struct
> media_pad pointer or an error pointer (ERR_PTR(-ENOTUNIQ) or
> ERR_PTR(-ENOLINK)); it never returns NULL. The current NULL check
> therefore never triggers, and the "pad not connected" error path is
> unreachable.
> 
> Replace the NULL check with an IS_ERR() check so the validation
> actually detects malformed media graphs.
> 
> Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi


