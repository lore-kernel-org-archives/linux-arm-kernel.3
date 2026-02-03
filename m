Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31637E6E7E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 10:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMUZ/RsSngzA2DOopAjpO7D4Ng+U+FwYb5fA0UXud2A=; b=rccMzP4Xw67lSVciDPxTdP5osc
	epLe7omdWYhkS5hxY0zvL4ea2BUYPcIlnJIe/EdSoSEx4bfqIoBK1BWoRv0ASix4hVlHQWOjmcJqF
	FBBIZWjRA4CWE+2KRpaX+wq6SdcTRchFt9b/KhgT5U1QvCJHcSThkFvbTp7HuHSuT3laer+Vhpqp7
	xydufRn89fRfNSlcvabZfUOX5E0MV5308i4HEf/fXP8oxesDbnplu7cLWSGD7w+NY2kEwpDN7eldz
	N/r4YG0FdzyvhwXGpkm/xJeL5PDlXqK56I4MGkMlzo57FGovYVjrKiZPHuE6R0ZqBCWF+CjOT40TF
	8kk/Z3oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDby-00000006TLq-2iZv;
	Tue, 03 Feb 2026 10:26:22 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDbw-00000006TLI-0v84
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 10:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770114380; x=1801650380;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=QYSyRyz/KNe8g75+aUGgAZFcRWSJp4MQIT2Dpm2e+gI=;
  b=XhUoFJy7ye8+Bf7WEx3Xe2eLG9jNocHjC2NPxdjhN6Xw5n43aBOk3/0H
   xK8/O28D+B4bY/mzaUltEvnzU9RdkacOZ7lr24fSDXkbIiucG1HenZC+Z
   rwZnx27SN23PJodQDgS8Rl++v5QitRZx+jf69VYXxZ4xkof51T4VLLcxg
   Xyd5eVCWLvAW2lv7xqWnU/tTAiu+ZIGNDMX3Dz5tNCL4O2wNpFq5De0F1
   Jj9UfMpjcUT+MdssFuFuCl8FjJaD5+LNYkfcqElTwDqsN7eqSd9iMlCUj
   slU6cxMeMO4u9ACN0P9VyBE9kDeRPIYu5DMURfQknHW3u9p+4KPveerK3
   w==;
X-CSE-ConnectionGUID: 6CUplTxUTCyOd7Fyv3ivSw==
X-CSE-MsgGUID: I8APF+BaSaChyN3AvoqRVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="96738961"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="96738961"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 02:26:19 -0800
X-CSE-ConnectionGUID: j3nOvX5aTQuQ/KI4ctPsjA==
X-CSE-MsgGUID: pP1ZD7WQRkuPTRRCkx9Kgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209097557"
Received: from black.igk.intel.com (HELO black) ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 02:26:15 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>, Yingchao Deng
 <yingchao.deng@oss.qualcomm.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Jonathan Corbet <corbet@lwn.net>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tingwei
 Zhang <tingwei.zhang@oss.qualcomm.com>, Yuanfang Zhang
 <yuanfang.zhang@oss.qualcomm.com>, Jinlong Mao
 <jinlong.mao@oss.qualcomm.com>, alexander.shishkin@linux.intel.com
Subject: Re: [PATCH v5] stm: class: Add MIPI OST protocol support
In-Reply-To: <dac5b6f0-5d0d-4dcd-b615-cdf9b81f4bf6@quicinc.com>
References: <20260129-p_ost-v5-1-2b14fff39428@oss.qualcomm.com>
 <83qzr7a0tm.fsf@black.igk.intel.com>
 <dac5b6f0-5d0d-4dcd-b615-cdf9b81f4bf6@quicinc.com>
Date: Tue, 03 Feb 2026 11:26:13 +0100
Message-ID: <83ldha9l8a.fsf@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_022620_267660_91783E14 
X-CRM114-Status: GOOD (  14.90  )
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

"Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com> writes:

> On 1/30/2026 5:48 PM, Alexander Shishkin wrote:
>> Yingchao Deng<yingchao.deng@oss.qualcomm.com> writes:
>>
>>> +	for (i = 1; i < ARRAY_SIZE(str_ost_entity_type); i++) {
>>> +		if (i == pn->entity_type)
>>> +			sz += sysfs_emit_at(page, sz, "[%s] ", str_ost_entity_type[i]);
>>> +		else
>>> +			sz += sysfs_emit_at(page, sz, "%s ", str_ost_entity_type[i]);
>>> +	}
>> Greg hates this. Documentation [0] says "preferably": "Attributes should
>> be ASCII text files, preferably with only one value per file.", but
>> somebody will get yelled at if this gets spotted, and since it's
>> probably going to be me, let's maybe not do this.
> Using two sysfs nodes, entity_available (listing supported options)
> and entity (the current value), is this acceptable?

My apologies, I didn't see that this was a configfs attribute (as it
should be).

Having said that, these ost types are almost enum stm_source_type. The
console is missing, but there is already a console source, so adding it
to the enum and the making the console source driver type that makes
sense. And once you have that, you'll get the entity type in your
ost_write() method via the @source parameter. Then, you'll only need a
tiny lookup table that maps enum stm_source_type to OST_ENTITY_* and use
that in the encoded packet.

This leaves the question of OST_ENTITY_TYPE_NONE and
OST_ENTITY_TYPE_DIAG. They are both unclear to me. OST_ENTITY_TYPE_NONE
basically means "no type, reject write", meaning that type 0 in an OST
packet is invalid, which seems weird and wasteful, is that what the
protocol spec says?

OST_ENTITY_TYPE_DIAG is also not explained; since we're already in the
tracing territory, "diag" may mean anything at all. From its value being
at the upper end of the 8-bit spectrum, I'm guessing it either something
very specialized or something very generic. Can it be a catch-all for
STM_USER (which is a catch-all)? Alternatively, you could propagate the
matched policy node's name to the pdrv->write() and in ost_write() check
if it's "diag" to select this type. strncmp() in pdrv->write() is not
ideal, though.

Either way, no extra attribute needed.

Because,

# mkdir diag ftrace console
# echo diag > diag/entity
# echo ftrace > ftrace/entity
# echo console > console/entity

is really a hat on a hat.

Would something like this work for you?

Thanks,
--
Alex

