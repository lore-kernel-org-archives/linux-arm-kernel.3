Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A939A606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 02:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=szn5H/oD;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AhELgdXW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeHN50YZ/NG8ZWpDQLHml+D4SpMDuGPRyLBAp8LeAZY=; b=szn5H/oDdH8Tm8YIr6LGHqChsd
	IdEFM8moi5t+RffHvs9wehYSOD5Ylr66IIB73AaDMRmtPuqy/NTZOPQpcSednTTVvzEvL2WVv4tqi
	A5qLXd8cE2rzAXfUvhEd90+9evlsPmxl2WaLdyE8L1EJHTMAFWNitCPVr7/GJP6mXCYROPDsqA+Hx
	6kDA57R13+Jmp2bAl94XuIpEcglG2oPALBQArEMoaZ0pR6/DACSSCJFN+4rql/5/XOmrupXGx9Nzt
	epUcqWvDqHNTKrVXn7//lLrObK76lbM4ZU8Ol1L3miKuFT+JxjoGUGWh1QZwfBmjN6aYvxiTFQa13
	dNreNq1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiNT-0000000DBdd-41ni;
	Thu, 22 Oct 2026 02:17:59 +0000
Received: from out-82.mta1.migadu.com ([2001:41d0:203:375::52] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiNQ-0000000DBcu-2Hiu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 02:17:58 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Qhn2nJhqTpx6IuD7zDJXbEf7KoM/IdTDiwQaIPdkdhQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792635471; v=1; x=1793240271;
 b=AhELgdXW2TpRdDnoVNwa80jru5dnYrpMqRckia/ZFKIq7jkTvPqiSVTJlHM8/zMSgYr2ITJ2
 cxvDJcQ1WPfQ+fqJHtU1Si/76j+zqJFHpdFSNh7oDyfgOXmayDypgFmmkWWCtikIYF0wDR2DB7U
 gSV35Tkn6c4UrAMH46WDm+vs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 9562aa6cc98d7210;
	Thu, 22 Oct 2026 02:17:51 +0000
X-Mizu-Trace-ID: 9562aa6cc98d7210
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 01/20] hugetlb: Don't restore vmemmap of non-HVOed
 folios on bulk restore error
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261021212738.321547-1-jthoughton@google.com>
Date: Thu, 22 Oct 2026 10:17:31 +0800
Cc: akpm@linux-foundation.org,
 catalin.marinas@arm.com,
 david@kernel.org,
 fvdl@google.com,
 linu.cherian@arm.com,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 mark.rutland@arm.com,
 nikos.nikoleris@arm.com,
 osalvador@suse.de,
 rientjes@google.com,
 ryan.roberts@arm.com,
 sunnanyong@huawei.com,
 will@kernel.org,
 yuzhao@google.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <11457D37-5AF9-46C2-95BC-CAD4B22741A1@linux.dev>
References: <491B482A-8177-447A-8CDB-AF83C13A5DEE@linux.dev>
 <20261021212738.321547-1-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_191757_237868_3C6B3EE2 
X-CRM114-Status: GOOD (  19.88  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> On Oct 22, 2026, at 05:27, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Wed, Oct 21, 2026 at 2:33=E2=80=AFAM Muchun Song =
<muchun.song@linux.dev> wrote:
>>> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>> index a1b51251103b..4dac7ed1df57 100644
>>> --- a/mm/hugetlb.c
>>> +++ b/mm/hugetlb.c
>>> @@ -1613,9 +1613,14 @@ static void bulk_vmemmap_restore_error(struct =
hstate *h,
>>>              * page is made a surplus page and removed from the =
list.
>>>              * If are able to restore vmemmap and free one hugetlb =
page, we
>>>              * quit processing the list to retry the bulk operation.
>>> +             *
>>> +             * Folios whose vmemmap was never optimized (e.g. =
because HVO
>>> +             * failed when they were allocated) can be freed right =
away;
>>> +             * remove_hugetlb_folio() has already cleared their =
hugetlb flag.
>>=20
>> Since you mentioned the hugetlb flag is cleared. So it's unnecessary =
to clear it again.
>>=20
>>>              */
>>>              list_for_each_entry_safe(folio, t_folio, folio_list, =
lru)
>>> -                     if (hugetlb_vmemmap_restore_folio(h, folio)) {
>>> +                     if =
(folio_test_hugetlb_vmemmap_optimized(folio) &&
>>> +                         hugetlb_vmemmap_restore_folio(h, folio)) {
>>>                              list_del(&folio->lru);
>>>                              spin_lock_irq(&hugetlb_lock);
>>>                              add_hugetlb_folio(h, folio, true);
>>=20
>> Something like following:
>>=20
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 6a011b627986..1ab3e61f4704 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -1616,21 +1616,31 @@ static void bulk_vmemmap_restore_error(struct =
hstate *h,
>>                 * If are able to restore vmemmap and free one hugetlb =
page, we
>>                 * quit processing the list to retry the bulk =
operation.
>>                 */
>> -               list_for_each_entry_safe(folio, t_folio, folio_list, =
lru)
>> -                       if (hugetlb_vmemmap_restore_folio(h, folio)) =
{
>> -                               list_del(&folio->lru);
>> +               list_for_each_entry_safe(folio, t_folio, folio_list, =
lru) {
>> +                       list_del(&folio->lru);
>> +
>> +                       /*
>> +                        * remove_hugetlb_folio() already cleared the =
hugetlb flag
>> +                        * for folios whose vmemmap was not =
optimized, so they can
>> +                        * be freed without restoring vmemmap.
>> +                        */
>> +                       if (folio_test_hugetlb(folio) &&
>> +                           hugetlb_vmemmap_restore_folio(h, folio)) =
{
>>                                spin_lock_irq(&hugetlb_lock);
>>                                add_hugetlb_folio(h, folio, true);
>>                                spin_unlock_irq(&hugetlb_lock);
>> -                       } else {
>> -                               list_del(&folio->lru);
>> +                               continue;
>> +                       }
>> +
>> +                       if (folio_test_hugetlb(folio)) {
>>                                spin_lock_irq(&hugetlb_lock);
>>                                __folio_clear_hugetlb(folio);
>>                                spin_unlock_irq(&hugetlb_lock);
>> -                               update_and_free_hugetlb_folio(h, =
folio, false);
>> -                               cond_resched();
>> -                               break;
>>                        }
>> +                       update_and_free_hugetlb_folio(h, folio, =
false);
>> +                       cond_resched();
>> +                       break;
>> +               }
>>        }
>> }
>=20
> Thanks, Muchun. :) I think it's slightly easier to read without the =
second
> folio_test_hugetlb(), like this:

More clear, LGTM.

Thanks,
Muchun

>=20
> 	list_for_each_entry_safe(folio, t_folio, folio_list, lru) {
> 		list_del(&folio->lru);
> 		/*
> 		 * remove_hugetlb_folio() already cleared the hugetlb =
flag
> 		 * for folios whose vmemmap was not optimized, so they =
can
> 		 * be freed without restoring vmemmap.
> 		 */
> 		if (folio_test_hugetlb(folio)) {
> 			if (hugetlb_vmemmap_restore_folio(h, folio)) {
> 				spin_lock_irq(&hugetlb_lock);
> 				add_hugetlb_folio(h, folio, true);
> 				spin_unlock_ire(&hugetlb_lock);
> 				continue;
> 			}
> 			spin_lock_irq(&hugetlb_lock);
> 			__folio_clear_hugetlb(folio);
> 			spin_unlock_irq(&hugetlb_lock);
> 		}
> 		update_and_free_hugetlb_folio(h, folio, false);
> 		cond_resched();
> 		break;
> 	}
>=20
> Applied this in the v3.


