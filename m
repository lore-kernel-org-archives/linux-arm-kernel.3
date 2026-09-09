Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D2BC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iW6sRnR+oQYWv1NkGkTa8AIJzqy44SrJn9mDEbTMddw=; b=jPMfnUAWQLwYBkKCSIttzYnuhe
	MMKG7B38/2khuGaPsRbj0915rBtQuxcnS8+PB32pQ4Tiq2i04nFUiJWj3IYlQWZq4rPsNIKVvnSdl
	itJfDXE0gAGTWA9mSynEANcTUdGCnUQSOqhJHvBlhYbwxYeyOJi9EIXZBfL6kG5M94SXKJXkZeh9+
	GVlNBY07FJNynUL/zEZtJsOn0jgpfQGhK8Dew2cJl5OQjywAttKmfPkmfRG7jfOXIH5yGTmflQZ3A
	9vIWTsfcpyv7ns+ZEVlvr9AI05wm9cgE4uvNtDbnMJPm0Tgvw3CjacN33HpGWzpay3Z53PmTeiCVf
	2BpOQd9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lzh-0000000CT1F-3XRY;
	Wed, 09 Sep 2026 17:21:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lzh-0000000CT0y-10Pp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 17:21:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iW6sRnR+oQYWv1NkGkTa8AIJzqy44SrJn9mDEbTMddw=; b=DA8yHoaWNUPzH7nZLkD1zw34Y5
	gtZJExLcv62fzf7s8SVqcnAwX2/AfR9CGJ1uOkR2HwTlaEbaX/PKRGejoCHoFhtIzruOPRYXk+JXZ
	GIQGQwnuvGRq4New+KKZmzxRgZvIm7hvbLLDqq0rS0Ki0g4FXl/HSsLUJicr3v5LUS31/ynHyUbsi
	t+1DYw4QUp1a58dOtGxZZ+HqQ2eXvbuY4jRDav1vZefKJA9FF9KKYFaZpfS42fKY5NFTTj64QZkLN
	hfnNHrVX9eWLzxMwBGydb2GwD49zrKpO3zX8mgdSSHyReI9N4v9wYops+hLvAUuCEPg6wfJ4IpFjR
	6fZFEd/w==;
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Lzd-00000001UEh-1BS9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 17:21:55 +0000
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689GZAJt134575
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 13:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=iW6s
	RnR+oQYWv1NkGkTa8AIJzqy44SrJn9mDEbTMddw=; b=lnF+tDfLDLC8zKGeJ7sI
	xJRtIeZcNmXG67Zr5UNCF1jcUSs7Md6RqW3R8kY6eZrCG9TVNI1Yv+yWlQZkoyxq
	FcVfcIdTqnVbLEFqBdLQcYGzf6a1eOJTGf33c0PEH1gsXdMHLOHa1fHresCicD6U
	hWzWNsR+qVSKFpg8DA1Uztk5Wmyg55jb58Dpt55AgxlYchc2hPL34WEb0ZPRmGk4
	XcZR1lxgEWXDmw54cBX0Qlv5FwHZl9d67dFz3cHGXK7XORSdN7F0Lk0MBhtmFY1J
	swFKU15gKmi9tUGWNQi7gR3DCAA9XUsgQi0wveu/pG3xI4T1h8cnoKKJ2VkVBlEt
	/w==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gjy91cst4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 13:21:43 -0400 (EDT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836c9f68dcbso118696877b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 10:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788974502; x=1789579302; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iW6sRnR+oQYWv1NkGkTa8AIJzqy44SrJn9mDEbTMddw=;
        b=patzePuXRLqP9teWajTVEtqCVAby2X4m9ypJKhhdSPcqGCXaS97hDKmCX2qjiHHQKH
         4GH5cpyfEY8sqZIEMl+8NozWrznq/0/DMb6oPxPOVoI+joCKA3P/Wa1SyYv4nSzBvKPr
         mBs2TmFXPfQZTwq+Hn+kAZveHAJEGUXlb1TzUQfmg9i83a3lEcNJUpe5swYeOb2x2Dta
         5vMjqhUB7cYekME6kGpH6g/gQkbUi97Y/uv9KjE6FKN8qGnpw2xUfIb0U1u/0wNTaTRk
         49Ib3MUrqPmb9ll8bmxc2KTSq0/aVkvk+upsW0EZn+d07XGXb87Y5PkR+oypaN0Lcryb
         JtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974502; x=1789579302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iW6sRnR+oQYWv1NkGkTa8AIJzqy44SrJn9mDEbTMddw=;
        b=K+UZMtlPC9mXx23FAHMVFAAxBSbr7AyikwpRyxtCgJ0vwPnRIGsbgew4WJGFyZCqTt
         FGQKv0na/DHOhsze3jTcLIRg4/D2eNkdqAV9aimbmZtEAQe5w9OKTDRA1mx00hT1zVID
         KpoYUZojKeCyrEtDqjDCgR/5RBCnsOs5M8yPFt6telhd+N2bfDOKH4MzkmNL5NKQQs/a
         6FITCe9lGXxw/1xy3qwoh2rfjTJ4FxGgzyAyci3mQwS5wfhqQsFGd4q6S6cMkZS2DJ3p
         teYsySNCxnXW4C5tkRYJCPXsAAfU88EY0hhiGq4Msy+X1AlHEXmQRs3iDDjuy6Ss/xHO
         6Keg==
X-Forwarded-Encrypted: i=1; AKwUvBxF51e0EXu4MIjPXhHd8EFqfC220AbbnwRgHtsn1CpAxoMNWzx1hLHMNH4nrgNMbTDagjJ77TEF37sNYr0V2Hv8@lists.infradead.org
X-Gm-Message-State: AFuF++nja6bHXPTonhmpJv/oE+mXLRZhufEwRorj1NoIC0r9xui+zJUq
	v6aJ0QpTegGlQZjxKHcxi8WxsLgmcaQjiP23EoNdHdYCbW+KFOCBWIgCqyiC+sVocPxqFNzyN40
	LW0ewuN9YuNAegEpvchHVWszq3ucoj7HQx45Lk0M4sn1JAfBQKOmu8wQi4NND4OvjtSQsZtUW
X-Gm-Gg: AYBFou1buBRGlMyDHqTfDjuSZJlGy8rWHl2eDlZObc6BXusLEetKbyI5lDk5VhoRsnm
	c1QyV/dmo0hIpl+p6DVV7qwrkNoRuJQreQCL4ExvRX6wxDauxANLhQhJjqqgRUkSK7qdRHdpAdA
	Ypx4w3xjDthrwZBDFJfuP44OFDg8APEMDfCSU5soOFgx3gei9XAucrnS+f6SZhcS/59O9KEqBqZ
	FjkevLsOQBcrXFymFJ86nVCE1l3pYaPlHOkTGd+/2ICq8qdGNA5a2i3rhlOam7KnIzKFQDKZbag
	CgFuGOPQ7KgRn75+4GchelKZVNEKCc9CcnBrwKYkYe5mQEooemZWEEv+/ItnvHQdXxO7p3KEqvt
	fCIvDaqSVjnW2QR06I5LQOGXUJVcnv7QnoSLAm1fE288H/oDHN5O3
X-Received: by 2002:a05:690e:4141:b0:66f:bca8:78d6 with SMTP id 956f58d0204a3-66fbca8b1d4mr11506178d50.18.1788974502322;
        Wed, 09 Sep 2026 10:21:42 -0700 (PDT)
X-Received: by 2002:a05:690e:4141:b0:66f:bca8:78d6 with SMTP id 956f58d0204a3-66fbca8b1d4mr11506121d50.18.1788974501815;
        Wed, 09 Sep 2026 10:21:41 -0700 (PDT)
Received: from [10.207.49.22] (nat-128-59-176-193.net.columbia.edu. [128.59.176.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106702d8f3sm43456006d6.23.2026.09.09.10.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 10:21:41 -0700 (PDT)
Message-ID: <cf9a0873-5ef1-4a5d-ba16-8ba3583ac8ba@columbia.edu>
Date: Wed, 9 Sep 2026 13:21:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] mm/swap: add folio_swap_entry() and
 folio_page_swap_entry()
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
        Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
        Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
 <20260908-folio_swap_entry-v2-1-ee6d01dfa5e1@columbia.edu>
 <d0aa1ccd-d99f-4fa5-98c2-21cea0f413c7@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <d0aa1ccd-d99f-4fa5-98c2-21cea0f413c7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M8V97Sws c=1 sm=1 tr=0 ts=6aa195a7 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=fJxgZNdXt3opHMdyAp+FXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=umqIAqnQUIpxI_lDA3YA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE5MyBTYWx0ZWRfX+qfDgzHhgMP4
 VO6xePv8tpTJs+G+9NL9M5ismQcnuRKZf0yCf8V9KDXIZrqKAmJ4eIqqBmsPhyltUAgRT16J+YG
 JH52stlsADF2LovTW8v6S9MImP9PBJ6WvXadhYdOgEJQ4GCaPsSW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE5MyBTYWx0ZWRfX+NIvwbBVG3G0
 2w+iJfdw5FzEvmH0u7/llctptPTsTH3LKdBKn3r4T9vWzVphgbXiMTW9ojVLNTqgU9GiBd/S94B
 hvweao2TlJnFy0cUhBItwxztukIxwwnx3YHJdhtU2wmMIrHNqizKSs7GA5zLRBc+kj/zsJNlLpx
 0XNK0zTQpZQ/U1qlbLCfNvKHhbRJP8aSAayWnt3Btd65POXGW7Tnx/ZVk6SU0u0wTNZEd2IZrKV
 1cnMJxvJU0O/9F+c7xrwgA7I61UUxMjRKf0l0G4CzUk3i7MHY2F2CGzp09llFNtAbuQRSaDI8nw
 Wiuok0kYjj9y0/v7q+wkQE8C60lWWedzIlDgXLWWc2U+q0823HfYsQdabOssheCFzg7xXWOIQoL
 n7mlJjmWnq5Wn0Yo62HFh/d5LM8PIQwIaPGx8IM08hn22+i4ugNxkACBUHz7ArZcjVLB3+MnIAw
 sKIYEb5lTOn0SrBGujA==
X-Proofpoint-ORIG-GUID: -ps3O3mJcP3ysQ99_EG4oXIMtqc2rlJc
X-Proofpoint-GUID: -ps3O3mJcP3ysQ99_EG4oXIMtqc2rlJc
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=10 spamscore=0 bulkscore=10 impostorscore=10
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_182153_685265_104D39B5 
X-CRM114-Status: GOOD (  25.87  )
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

On 9/9/26 5:00 PM, David Hildenbrand (Arm) wrote:
> On 9/8/26 17:16, Tal Zussman wrote:
>> A folio in the swap cache occupies folio_nr_pages() contiguous swap
>> entries starting at folio->swap, so a page's swap entry is just
>> folio->swap plus the page's index in the folio. page_swap_entry() hides
>> this behind a compound_head() call, and callers that already have the
>> folio sometimes open-code the arithmetic instead.
>> 
>> Add folio_swap_entry(), which takes a folio and a page index, and
>> folio_page_swap_entry() for callers that have the page.
>> 
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
>>  include/linux/swap.h | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>> 
>> diff --git a/include/linux/swap.h b/include/linux/swap.h
>> index fc290e29e4a9..1d979e76e78a 100644
>> --- a/include/linux/swap.h
>> +++ b/include/linux/swap.h
>> @@ -272,6 +272,39 @@ struct swap_info_struct {
>>  	const struct swap_ops *ops;
>>  };
>>  
>> +/**
>> + * folio_swap_entry - Return the swap entry for a page within a folio.
>> + * @folio: The folio.
>> + * @idx: The index of the page within the folio.
>> + *
>> + * A folio in the swap cache occupies folio_nr_pages() contiguous swap
>> + * entries starting at folio->swap. The caller must ensure the folio is
>> + * in the swap cache and that @idx is within the folio.
>> + */
>> +static inline
>> +swp_entry_t folio_swap_entry(const struct folio *folio, unsigned long idx)
>> +{
>> +	swp_entry_t entry = folio->swap;
>> +
>> +	VM_WARN_ON_ONCE_FOLIO(idx >= folio_nr_pages(folio), folio);
>> +	entry.val += idx;
>> +	return entry;
>> +}
>> +
>> +/**
>> + * folio_page_swap_entry - Return the swap entry of a page in a folio.
>> + * @folio: The folio containing @page.
>> + * @page: A page within @folio.
>> + *
>> + * The caller must ensure the folio is in the swap cache and that @page
>> + * is part of @folio.
>> + */
>> +static inline swp_entry_t folio_page_swap_entry(const struct folio *folio,
>> +		const struct page *page)
>> +{
>> +	return folio_swap_entry(folio, folio_page_idx(folio, page));
>> +}
>> +
>>  static inline swp_entry_t page_swap_entry(struct page *page)
>>  {
>>  	struct folio *folio = page_folio(page);
>> 
> 
> "Return the swap entry for a page within a folio" vs. "Return the swap entry of
> a page in a folio."
> 
> yet only of the variants has a "page" in the name :)
> 
> A bit confusing.
> 
> Not immediately sure how it could be done cleaner. The minority of cases seem to
> use folio_swap_entry.
> 

Yeah... I considered naming them folio_swap_entry() and folio_swap_entry_idx()
(or a variant of that) but I liked the page version more. I can update the
comments to try to differentiate between the two a little more if that would
help. How's "Return the swap entry at an index within a folio"?

> -- 
> Cheers,
> 
> David
> 


