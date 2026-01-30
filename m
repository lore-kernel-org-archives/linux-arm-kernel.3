Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBCCD49C8D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGaftGN/7JeRx3xvdO+qtcvMRBI1/jXUB9jLXcazqtU=; b=XsO/qOL8+fMETrDvTXsTkqxZTu
	ob0eoNu9HFPbfj8s8mEiTNLSfeuBSU5hFpRQ0fZMbCvWJ+B41eLvZpU/kEw2MdcEUBt4SLtJjv1Y+
	jUnD+WWAb2s+VqBKxuw94Dmt6MKN0QzCS6rWE4A8JrlYxCTUBQcdHVVdBIbs4ON3mTom1kvE2txy2
	ZWFiq6W3k6lu66dXmyPvLUazQbLKlkGSDzZhVPDib35uvUkq67upJTWC5z4BgD0cKk94xtYkum1gU
	AJ5NzzXdBXguZn/Ea0C8osWeYXg0sE7Xa2GvN86t2MTT9Elo6NYcqArA9yR11RnhspnbXnUzwvVFy
	iHrNVS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vll6t-00000001HYi-2Hq0;
	Fri, 30 Jan 2026 09:48:15 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vll6r-00000001HYL-2Jgv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 09:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769766493; x=1801302493;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=9EX3E35P6Hg1Iq7h2iJkGkUFnTJjztYiXmMhmEhbRFM=;
  b=bzDuZ0+MNEE4LPD/COGagQ0Pkjo53xUMIAhcvbKx/VlclThituHsuvAq
   Hn05HtVGCuXaNQhi6YsTvBiyg6fOexYf2a+NH2LFgr5aVp0AL1IONU9Xe
   Ib69+3ip8Uweetb+zAqUgDaTH4S7PK1M8vmV0uh1bao1yfHOmn/Ksa/xV
   U6Khw8v0M90n+8QJWGIlnY1aV4rEpxIbwMujkRw4BcCVk8Uf8IuVtRyi6
   UDFYNGKgBfgtjMOZcUVDWqp8LYx0hWN7X6UaZgMAwzb+PhoL+9K20Hrek
   T1pHqt0jfowBiydj2ajYwfAO/wMpfPxKO6VPTbJ7Ef9Jw5jpyo9R1AzuU
   w==;
X-CSE-ConnectionGUID: 0gRBMzcDSEeBbHCXUcnuUA==
X-CSE-MsgGUID: HtV0Vw4DQKWEAi9UvCF08A==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71103470"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="71103470"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 01:48:11 -0800
X-CSE-ConnectionGUID: poeentPyTEmvZx/1oQTsMQ==
X-CSE-MsgGUID: xtlOClocSheYT7NO0kaQ2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="240078451"
Received: from black.igk.intel.com (HELO black) ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 01:48:07 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Jonathan Corbet
 <corbet@lwn.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, quic_yingdeng@quicinc.com, Tingwei
 Zhang <tingwei.zhang@oss.qualcomm.com>, Yuanfang Zhang
 <yuanfang.zhang@oss.qualcomm.com>, Jinlong Mao
 <jinlong.mao@oss.qualcomm.com>, Yingchao Deng
 <yingchao.deng@oss.qualcomm.com>, alexander.shishkin@linux.intel.com
Subject: Re: [PATCH v5] stm: class: Add MIPI OST protocol support
In-Reply-To: <20260129-p_ost-v5-1-2b14fff39428@oss.qualcomm.com>
References: <20260129-p_ost-v5-1-2b14fff39428@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 10:48:05 +0100
Message-ID: <83qzr7a0tm.fsf@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_014813_628859_171D9798 
X-CRM114-Status: UNSURE (   6.78  )
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

Yingchao Deng <yingchao.deng@oss.qualcomm.com> writes:

> +	for (i = 1; i < ARRAY_SIZE(str_ost_entity_type); i++) {
> +		if (i == pn->entity_type)
> +			sz += sysfs_emit_at(page, sz, "[%s] ", str_ost_entity_type[i]);
> +		else
> +			sz += sysfs_emit_at(page, sz, "%s ", str_ost_entity_type[i]);
> +	}

Greg hates this. Documentation [0] says "preferably": "Attributes should
be ASCII text files, preferably with only one value per file.", but
somebody will get yelled at if this gets spotted, and since it's
probably going to be me, let's maybe not do this.

Also, the ST Microsystems people don't need to be CC'd on Software Trace
Module patches: it's the same TLA meaning 2 different things. Everybody
does this, so I'm assuming they're cool with it, but FYI.

[0] https://docs.kernel.org/filesystems/sysfs.html#attributes

Thanks,
--
Alex

