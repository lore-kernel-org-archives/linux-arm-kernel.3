Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3FCC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsBxyZQSbtmN6rj7GHHMZyoWDo8ZAcme80/1hkFgCmc=; b=ddz1MMZIWHtHoah6ZzNVtEXd4/
	8Nj9UbxPBVHVLJI+joMroTJTgy9v8fXNfm5ktH/nE2GzzxPnF9ddg5AnNxBEgvqEgfiQppNQXe7rA
	RGQMeU63bkcUO9SVsdhNwv+RJNed5PZnQOLllhP/Vb5FCQEcB+Wt/IH2bg5bl6Vl6U+ox3Ez17k8s
	rSwTp2Hhd0sx4qQI3yNqZHRc5DUK0bDSrUppV/m5hBixZJ9reJhKQ5ZROT7tfmZAOl4xw8fkHI1tK
	OiJVYh6oq8xiF3Rs8rg/Wp2lSsyFVhbweDAFahgqgq4Klr20GXwluWmFAhpAIKrYWrcKk7h9T3k4V
	Ez8KyyKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5eu-0000000FpCr-49zZ;
	Wed, 15 Jul 2026 19:52:44 +0000
Received: from trager.us ([52.5.81.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5es-0000000FpCT-2Q1T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 19:52:43 +0000
Received: from c-73-254-161-40.hsd1.wa.comcast.net ([73.254.161.40] helo=[192.168.1.226])
	by trager.us with esmtpsa (TLSv1.3:TLS_AES_128_GCM_SHA256:128)
	(Exim 4.92.3)
	(envelope-from <lee@trager.us>)
	id 1wk5ee-0008Vc-Ky; Wed, 15 Jul 2026 19:52:28 +0000
Message-ID: <673b79c0-d2e6-44a6-a1a8-a2ff92f2ff53@trager.us>
Date: Wed, 15 Jul 2026 12:52:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/16] arm_mpam: propagate MSC read errors for
 __ris_msmon_read()
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260710144520.917375-1-andre.przywara@arm.com>
 <20260710144520.917375-7-andre.przywara@arm.com>
Content-Language: en-US
From: Lee Trager <lee@trager.us>
In-Reply-To: <20260710144520.917375-7-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_125242_622824_0ACACF79 
X-CRM114-Status: GOOD (  10.13  )
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

On 7/10/26 7:45 AM, Andre Przywara wrote:

> @@ -1748,6 +1758,7 @@ static int mpam_restore_mbwu_state(void *_ris)
>   {
>   	int i;
>   	u64 val;
> +	int ret = 0;
>   	struct mon_read mwbu_arg;
>   	struct mpam_msc_ris *ris = _ris;
>   	struct mpam_class *class = ris->vmsc->comp->class;
> @@ -1760,10 +1771,14 @@ static int mpam_restore_mbwu_state(void *_ris)
>   			mwbu_arg.val = &val;
>   
>   			__ris_msmon_read(&mwbu_arg);
> +			if (mwbu_arg.err) {
> +				ret = mwbu_arg.err;
> +				break;
> +			}
>   		}
>   	}
>   
> -	return 0;
> +	return ret;
>   }
>   
>   /* Call with MSC cfg_lock held */


mwbu_arg is never initialized and __ris_msmon_read() only writes ->err 
on failure. If on a successful read mwb_arg.err tests stack garbage it 
can spuriously break ot of the loop, leaving the remaining monitors 
unrestored, and return a junk error code.

Setting `struct mon_read mwbu_arg = {};` matches what mpam_msmon_read() 
already does. Additionally val should be initialized to 0 too. 
__ris_msmon_reaD() does *m->val += now, and although the result is 
discarded here, KMSAN would flag the uninitialized read.


