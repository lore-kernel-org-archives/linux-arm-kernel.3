Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5822BCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 21:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+8cMbDNxklCbCV4sxFCT7EnrE127VbBQwccd1APhfc=; b=Hvv7P9SgdsS3sFKMacpxYBCohn
	2KSMxLAWSps+RISb/joyzMKHCeswnPLAVUKSmVpokQiC4rfBkqLWS5O7+X9N+cuMDwckoRZPAKyoO
	SgKJ3F7sOtkkapdY5S+siOG5QEDejd/uzF5bEBXl7zEnxgfdAPGZsxR0+JRVjK9LzkcXoJYMqbInh
	7ES8AShyIXBLcruu52lqhDok2cat8Y5hvUeWl/pG9ydZPMDUyGWiFvIO2qjv3yv4bK21YPjst1Mrd
	d231OccVrOC0vzDym1tsmT9fnhU9dfOml/awWHvUhJoh7sKsNdS7evbxtZqhgnCUTJuEu5VHM4a+A
	qAQH8i0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6yab-00000007BrH-1sNx;
	Thu, 09 Oct 2025 21:54:21 +0000
Received: from mail-pj1-f47.google.com ([209.85.216.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6yaY-00000007Bqw-3cYa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 21:54:20 +0000
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so1236988a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 14:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760046858; x=1760651658;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+8cMbDNxklCbCV4sxFCT7EnrE127VbBQwccd1APhfc=;
        b=eLHLHt6D9xOngMZhS2YAfS+OLQMs0pRsRp3MAobFahCnbG1EGCBF7V9NDAkLkm0o/O
         oLpvPA6uRnoyCLabTwhyZzwICgDJUrVqrXP6hSbq78661K6V7SDbHd3IAw1jOnsOMJXy
         qYITxGAvYp3iKDZEK6lWNAigPEk+MA8EcgIvqZhDEIgA/1cgH1heNvGjqQ3FbdGfSR3h
         pNYBctunbHz4jWeS2ZhOqbwlLY/LHNeE9jO/FeSNTG43J8ak4roKD7rkFSMFNavlkOqN
         b4oF5MfYHXGbakj22qUd0TXNZlT52+rayMgJKXA0cLVxUPyflK+hzm3SiTYFWHK8svna
         XBqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjmqj01EOVwGOeK3jNEy6MfcdjSW/AqlQU1G5z7V2E6Q8mYFyufDcqqtotinZQj1uo1G11i4jfNJMag3FZgMmA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4Roiu0I2YRV3RSDDoBmbRLo0MIpFmU7cf8GFVpVlX6+Tg72gz
	Idxv7NpjkIsZfmAnZeB+BBQmol07Ap4HV9pforJOG7jKiw3TBz/dUFBqkr7jKPevQqo=
X-Gm-Gg: ASbGnctZEK6XC/6KGGdgDbxODYvoWJrfH47trE+/KQSXqFggT7YBn9zicXOTmbCFIc9
	47JAgk7vclRaycnEC0keOGSsBwTv4Mo8q/9OF3+crqPnPP8mHN7qyrc9aYvomTYQgAUlijAH8/5
	NLQ9ZXBNX4QOfLHT24dlHZxyaoEH6UaLDH1cYaa0Mm7uA4De0Pxq5OJJ+YnP3KNSbnu7YOj23Hz
	LW5ltgb334RJeTeJhEOpUVgQ8vzklchWKD65c3BdNcTmdbzoyi7eG2YDCYq+BP73dW2FQ2izTAA
	zjRRQY8uA1Wx/ziVRHbP6/50qNTEFs2XsXWImljsYJey1bmXI42x7BH+THTn7Z84WrjCBcqbC+C
	kpKk54rVDl1lOGwNNV1UjAu1mh0/Etw5aHeAiNW6XkqWwIlGJDG/Gmj4=
X-Google-Smtp-Source: AGHT+IHNJd9z3jsIW8ArDj5mAZGmK88KLPxR1ZRHy8f1OQIbnvz7GwmoWU71oPFD25bkRDCull6/og==
X-Received: by 2002:a17:90b:3e83:b0:330:797a:f4ea with SMTP id 98e67ed59e1d1-33b513a2006mr12119692a91.29.1760046857536;
        Thu, 09 Oct 2025 14:54:17 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aabbe8sm885584a91.12.2025.10.09.14.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 14:54:17 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Saravana Kannan
 <saravanak@google.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, Sebin Francis
 <sebin.francis@ti.com>, Diederik de Haas <didi.debian@cknow.org>, Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>, Jon Hunter
 <jonathanh@nvidia.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] driver core: fw_devlink: Don't warn about
 sync_state() pending
In-Reply-To: <20251007094312.590819-1-ulf.hansson@linaro.org>
References: <20251007094312.590819-1-ulf.hansson@linaro.org>
Date: Thu, 09 Oct 2025 14:54:16 -0700
Message-ID: <7hms5zlp13.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_145418_901751_ABEDC825 
X-CRM114-Status: GOOD (  12.34  )
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

Ulf Hansson <ulf.hansson@linaro.org> writes:

> Due to the wider deployment of the ->sync_state() support, for PM domains
> for example, we are receiving reports about the sync_state() pending
> message that is being logged in fw_devlink_dev_sync_state(). In particular
> as it's printed at the warning level, which is questionable.
>
> Even if it certainly is useful to know that the ->sync_state() condition
> could not be met, there may be nothing wrong with it. For example, a driver
> may be built as module and are still waiting to be initialized/probed. For
> this reason let's move to the info level for now.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reported-by: Sebin Francis <sebin.francis@ti.com>
> Reported-by: Diederik de Haas <didi.debian@cknow.org>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

