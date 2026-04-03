Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F30D6AAFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 01:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0pN8aUKmhnmAGTXsEU3mqDCvjefLUa2M7SMOn3aBe0=; b=CNmeRiCdXelh4UZOm3Zjjrk9Ud
	ewFWU1v0WvEYXoO4Sl/AO5VgGaS/MbyEt2VImsNz+YTsnZyahcdjDA5216dx8yXS+xByAxV0a7QFI
	N1bLVflqPl0LS2hb+AQp300wlTcp6OmLOrgK2EHdEKuVCcBilAF9O5iana+R/W6LMpk/m47hpc1eR
	M4J6eVEO2qRow1WzI6U9jxbdFAubpxl5vzuxoPEHr9qJIsIW1ch7KMAQI5qQXcrlZr7trZwH9R3OE
	+SRODRVDvwiiEAJ35P/B+5b5VTchE3EvA9e8dJ5wUT4V0AaCUX5VbbINzGuVpmToU2EE8naQj9nVf
	ElvKNQqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TAB-000000011j5-0LGk;
	Fri, 03 Apr 2026 01:17:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TAA-000000011ii-0T9T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 01:17:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6242160126;
	Fri,  3 Apr 2026 01:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1375CC116C6;
	Fri,  3 Apr 2026 01:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775179049;
	bh=IU9zpV+fhw/AVGDmlIS+prrr3RJ46Y3yClO3R5MZOJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fvBhotl1IEvyAFT2T/qEv9rf8dWP9JNEuuEOqn3jzMpIQEMFOgSoIlSrwyysbQJH6
	 4ZdUqynMTLHMzK1zM5kGAHNMAaMIVREs5KvkRHA/m7Vl1cFyB1OsaDjbKB72LGmYO8
	 NvoiXno04iCv9rJ/c/rN1K0DjJEPOWRwgkY3hOBcdws4kU5zx2P/8KdidjDb4eOd2d
	 Wkroi3b2cTFnMOunZ5dbeRfzIcwt4klfueHVLjUfXCVM+MVYSyOIhoH2RUiGKB4dxW
	 NU8QdrlH6J1+lTqPGxVX15h8OmVA+ETYG4W5EDjYM34q7HZeDAvjT/uFvWObt4pU0x
	 Mm9Aly2jvUauw==
From: Jakub Kicinski <kuba@kernel.org>
To: wei.fang@nxp.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	f.fainelli@gmail.com,
	frank.li@nxp.com,
	chleroy@kernel.org,
	horms@kernel.org,
	linux@armlinux.org.uk,
	andrew@lunn.ch,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 net-next 04/14] net: enetc: add basic operations to the FDB table
Date: Thu,  2 Apr 2026 18:17:26 -0700
Message-ID: <20260403011727.1795379-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331113025.1566878-5-wei.fang@nxp.com>
References: <20260331113025.1566878-5-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: enetc: add basic operations to the FDB table

This commit adds FDB table management operations (Add, Delete, Update,
Query/Search) to the enetc driver using NTMP version 2.0. FDB entries
are managed via the command BD ring.

> diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
> index 916dc4fe7de3..a9f3e6cbf422 100644
> --- a/include/linux/fsl/ntmp.h
> +++ b/include/linux/fsl/ntmp.h

[ ... ]

> @@ -116,6 +158,31 @@ static inline int ntmp_rsst_query_entry(struct ntmp_user *user,
>  	return 0;
>  }
>  
> +static inline int ntmp_fdbt_add_entry(struct ntmp_user *user, u32 *entry_id,
> +				      const struct fdbt_keye_data *keye,
> +				      const struct fdbt_cfge_data *data)
> +{
> +	return 0;
> +}

If CONFIG_NXP_NETC_LIB is disabled, will returning 0 here cause callers to
falsely assume the operation succeeded and proceed to use an uninitialized
entry_id pointer? Would it be safer to return an error code such as
-EOPNOTSUPP for stubs that have output parameters?

[ ... ]

> +static inline int ntmp_fdbt_search_port_entry(struct ntmp_user *user, int port,
> +					      u32 *resume_entry_id,
> +					      struct fdbt_entry_data *entry)
> +{
> +	return 0;
> +}

Similar to the above, does returning 0 here leave both resume_entry_id and
entry uninitialized while signaling success? Since resume_entry_id is
typically used as an iterator, could this lead to an infinite loop or other
unpredictable behavior in the caller if they interpret the 0 return as a
successful read of valid hardware configuration data?

