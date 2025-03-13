Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2BFC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 16:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKcLmiNNi+InVHi7szN5VvzBxGJ1ZV4koF9yq2Mj56E=; b=M7cE4/MIky3x8FXYkUUX8WsNyT
	u0Oljn8ai8oMsyGDSNOE+a1s6au2vBBYaYL3yMXitc/zz86yJ0nrYGz+HHhkuWTmbNkOso3km0N4Z
	ZOdAbpCdcfkZagiV4BZSvFdM30v9xdXiLVj/gH5Kl7nB2TEtAQhJMpLFz8BF9c8wNyqkNYMn7JQDk
	2igJIDx1eoF84pIjH0zLyz4sdZJzRAqZrQX9cnGM73N6PsJVcIjpp2+5skH+A7+owyUXJrXn+rDBi
	ryGFdt477qVW1aQ7otmACIZ/2oEQvkPLKXsD+o4rDFjqQZ5ClEWyhOAIACdZCgGruIUOMAEXbTJ3T
	9EgYBzRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsl2q-0000000BkNM-0D6K;
	Thu, 13 Mar 2025 16:04:28 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tskuy-0000000Big5-2scK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 15:56:21 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id D11BC2033428;
	Thu, 13 Mar 2025 08:56:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D11BC2033428
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741881379;
	bh=LKcLmiNNi+InVHi7szN5VvzBxGJ1ZV4koF9yq2Mj56E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qSExLbcPE0nUhHTgfvpnil9EmZuIMMSMVTDhe2uERE4lfle83/MgTG/KdG0Y29IBw
	 dFMT3xgTbiqrd2QyplZgYbBU+EfyIBNbGBcD8Xh1V7EdpBIjZR5ZNZ4gTi/C/AsMs1
	 j4PyUkiW1dba5UiyKnL1QfdZk2Ow5UZhErEHVqKU=
Message-ID: <6ba21efb-7065-44d7-9cee-265a0c137f0c@linux.microsoft.com>
Date: Thu, 13 Mar 2025 08:56:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] Drivers: hv: Introduce per-cpu event ring tail
To: Tianyu Lan <ltykernel@gmail.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com,
 decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org,
 joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org,
 lenb@kernel.org, corbet@lwn.net
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-8-git-send-email-nunodasneves@linux.microsoft.com>
 <CAMvTesAW-9Mo0oY6UUh2anp6DQCSsVCUhBiV2-bKp2VD_N0DYw@mail.gmail.com>
 <5e3e8c30-912c-4fe3-bfac-1ae21242473b@linux.microsoft.com>
 <CAMvTesAPeLBfYVa5TGx-o6p+0g_Q1bn6s+nZK5i7NK8QGyfbTA@mail.gmail.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <CAMvTesAPeLBfYVa5TGx-o6p+0g_Q1bn6s+nZK5i7NK8QGyfbTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_085620_777700_A791415D 
X-CRM114-Status: GOOD (  22.34  )
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

On 3/13/2025 12:34 AM, Tianyu Lan wrote:
> On Thu, Mar 13, 2025 at 3:45 AM Nuno Das Neves
> <nunodasneves@linux.microsoft.com> wrote:
>>
>> On 3/10/2025 6:01 AM, Tianyu Lan wrote:
>>> On Thu, Feb 27, 2025 at 7:09 AM Nuno Das Neves
>>> <nunodasneves@linux.microsoft.com> wrote:
>>>>
>>>> Add a pointer hv_synic_eventring_tail to track the tail pointer for the
>>>> SynIC event ring buffer for each SINT.
>>>>
>>>> This will be used by the mshv driver, but must be tracked independently
>>>> since the driver module could be removed and re-inserted.
>>>>
>>>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>>>> Reviewed-by: Wei Liu <wei.liu@kernel.org>
>>>
>>> It's better to expose a function to check the tail instead of exposing
>>> hv_synic_eventring_tail directly.
>>>
>> What is the advantage of using a function for this? We need to both set
>> and get the tail.
> 
> We may add lock or check to avoid race conditions and this depends on the
> user case. This is why I want to see how mshv driver uses it.
> 
>>
>>> BTW, how does mshv driver use hv_synic_eventring_tail? Which patch
>>> uses it in this series?
>>>
>> This variable stores indices into the synic eventring page (one for each
>> SINT, and per-cpu). Each SINT has a ringbuffer of u32 messages. The tail
>> index points to the latest one.
>>
>> This is only used for doorbell messages today. The message in this case is
>> a port number which is used to lookup and invoke a callback, which signals
>> ioeventfd(s), to notify the VMM of a guest MMIO write.
>>
>> It is used in patch 10.
> 
> I found "extern u8 __percpu **hv_synic_eventring_tail;" in the
> drivers/hv/mshv_root.h of patch 10.
> I seem to miss the code to use it.
> 
> +int hv_call_unmap_stat_page(enum hv_stats_object_type type,
> +                           const union hv_stats_object_identity *identity);
> +int hv_call_modify_spa_host_access(u64 partition_id, struct page **pages,
> +                                  u64 page_struct_count, u32 host_access,
> +                                  u32 flags, u8 acquire);
> +
> +extern struct mshv_root mshv_root;
> +extern enum hv_scheduler_type hv_scheduler_type;
> +extern u8 __percpu **hv_synic_eventring_tail;
> +
> +#endif /* _MSHV_ROOT_H_ */
> 

It is used in mshv_synic.c in synic_event_ring_get_queued_port():

diff --git a/drivers/hv/mshv_synic.c b/drivers/hv/mshv_synic.c
new file mode 100644
index 000000000000..e7782f92e339
--- /dev/null
+++ b/drivers/hv/mshv_synic.c
@@ -0,0 +1,665 @@
<snip>
+static u32 synic_event_ring_get_queued_port(u32 sint_index)
+{
+	struct hv_synic_event_ring_page **event_ring_page;
+	volatile struct hv_synic_event_ring *ring;
+	struct hv_synic_pages *spages;
+	u8 **synic_eventring_tail;
+	u32 message;
+	u8 tail;
+
+	spages = this_cpu_ptr(mshv_root.synic_pages);
+	event_ring_page = &spages->synic_event_ring_page;
+	synic_eventring_tail = (u8 **)this_cpu_ptr(hv_synic_eventring_tail);
+	tail = (*synic_eventring_tail)[sint_index];

