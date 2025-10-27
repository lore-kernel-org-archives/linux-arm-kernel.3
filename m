Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A2FCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgRMpIuzEklhMyLqeSgTqelB6K/jP1FY8xNuF/F7waE=; b=4dg5nWS12eMJ+kZ75+yZ6bLBNK
	WwWEi17N6eqSkvFXY3j/ZBmpXFhMvsB0n9jUBrA1o4s9sPqLvmqw62u9Y1PpAA9up3KbAUiA6urkL
	fB0Xg+3PpcHUf9T/kHKM/fPMWDupJbzVbalIG1DRnqMN9rw2hI5V+DCjG78yX1lsuWv+AEtDAstr1
	a1COAM074x/qLp0y9etLJ4zmYyqkcPerFLVGhhQ0NKAHd7tuQQw/DdX+8gCJqlQcKeDg4Q2P96Duq
	IQGPs1EVDCn7IgtEOLqzaSsukr/YqLrti5vvzhipotZ9zL1YywgoPZK40Of6Qf9/DWP2IdNT48wZX
	mBO6Z3mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPmC-0000000EHcF-1Qws;
	Mon, 27 Oct 2025 16:08:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPmA-0000000EHbr-11Qk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:08:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RBK7sw2547940
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 16:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KgRMpIuzEklhMyLqeSgTqelB6K/jP1FY8xNuF/F7waE=; b=mcGpyXKeJIl3if0g
	BTHBHMbOb5aFzf8YLocOxs83v1pY7wAmIyfj/BIAB05engfqIrH8DQ7Dze48c6V5
	jUkJSqKFQihpS/LuCSe55d0lqn4kiJO6svl7GdaUM3r77/bQcB04FoBJTPxYiiVV
	oa/EVozhJoNDzSGj+gguASqcrQZDUEkNHgfvcB5ZJqk8Adqtwcz9E3Q0j8pfWibY
	iPs8skpBVponxxBsg4fBAE3GYhx/gSSrArMH39KJtG3WfN2viTmYsO3KA6PPIHGi
	YUREWHeHZGQPrTYgWB5VJ+9meKoTXlHnMNzARJM7e3FHDOpd9fG2H7pXlOtQ39QB
	+Fc7Mg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2gy4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 16:08:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a2878dca50so5822327b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 09:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761581332; x=1762186132;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KgRMpIuzEklhMyLqeSgTqelB6K/jP1FY8xNuF/F7waE=;
        b=FYlG2V+x/aVyXx5am7ngwixHAgyls0CieaqtTJc7egW5+iRTP7praGUcY3dRDnUYce
         nTiwzt1IWFCjRCyOkIcsF9rjqHHngVqKED7E7ttoZDGzvhqtbiMUOhjsHTW4w/BPOs/S
         PDqluYXdgdtpNG0BFQntiomdIv0sw1RaqkHugZifM6+8FyclcQ3oPvGxH5jgr70z6agE
         TIEVHoSIanRDeNjaZ3X39yfBp4WN5sI1g5oNJ7wDTwwy03ku7RiWdNSL8h2q0b15jQKS
         6TSibh6dWPVkDIzvXnEw9VM0elkbAuKbWVaCB7Y9uDjeUy26kS/T89seWfJm2KrFAt6j
         dt8w==
X-Forwarded-Encrypted: i=1; AJvYcCXaTDSpqvZwEFqpwyeR1T95E8QzHijxoLlafFgFrbjIOi1qOTaZ1M7zMCkFFE26ec9wsY9VfTfOmtN6Divq2DzR@lists.infradead.org
X-Gm-Message-State: AOJu0YyG58i5ix4rUT5KdleT0ljAp3TSCH7axZpk3S8Dtda24PDwXxXV
	hnjsR134D9HXaqt7S2nPkYfi6LC39U6TaxZ5eRSI/yfXyFkkZVWlAvc50/Qrvnmy7Td3RVMuCjb
	ffDifY5rtI9GuA+fop+8KbfswjLhMiNX/kQDSuPhuSy23GIHatBgAventLHYXPcyxF+7n7u3qOq
	s1/Q==
X-Gm-Gg: ASbGnctHYONXn931xaLx+yY6YIB7KjAcgeOeojvexpvCzEgKA45apWX/RdxyMYJx1U1
	TuJYHisKYPMeyHUKrKWbJnnK16CV79VHHO4zL66wqIJAfs58mzW4zK986KoKS+AoGMAD4l8Iy5+
	l6WtOIF24QVeZPHpKYvwjjtbcgyCqRUzMNrTcDoKBSDNf9IXFvtE1UM3QkxRhk9JvsI0yY8OP9P
	EQJVcW3rJfyK2pUyEqGnvVAeZoV5ZRCvsW78S08fE1E2nR7gOg+TfDfL+HraL+c0hFs17kz1QMV
	3vRbZryAObyfZps6zaemU5lUuHpK0OQcLzknTXarswzzCkrq2f4Nk18gx3Ba3c9IAqmhHd+vFBX
	Puj2Qo1aJQiirAoQ3Rg3AXdHtwmP5sgoC39z5T4ofDUllMyPeQTCcAGzWd4A=
X-Received: by 2002:a05:6a00:b42:b0:7a2:8201:e35a with SMTP id d2e1a72fcca58-7a441c377b7mr521889b3a.19.1761581332096;
        Mon, 27 Oct 2025 09:08:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7riuKLotC98dQqIszw6mdR718UOVWaI+4GmJRuMzQgpAmf75t39TRUDzdW3vneRdu0UeB2Q==
X-Received: by 2002:a05:6a00:b42:b0:7a2:8201:e35a with SMTP id d2e1a72fcca58-7a441c377b7mr521838b3a.19.1761581331421;
        Mon, 27 Oct 2025 09:08:51 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049c01sm8540758b3a.37.2025.10.27.09.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 09:08:50 -0700 (PDT)
Message-ID: <b002e4e7-fb35-4c2b-8414-b26aa7f71f25@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 09:08:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/21] Docs: add Functions parameters order section
To: Jani Nikula <jani.nikula@intel.com>,
        "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20251025162858.305236-1-yury.norov@gmail.com>
 <20251025163305.306787-14-yury.norov@gmail.com>
 <723c936f92352352c3b1a84b858d684f5b7a0834@intel.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <723c936f92352352c3b1a84b858d684f5b7a0834@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A1w-sEUWxxP2e_TXzk7u-WW6TogvJkHd
X-Proofpoint-GUID: A1w-sEUWxxP2e_TXzk7u-WW6TogvJkHd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE1MCBTYWx0ZWRfX+yFc+6XVI1Ci
 194mHKKBmH7SKIWIPpfC9Nm6uNJhLa9wvirUrnm57EyCF4WW7pxEj0F+dQSAbkUHF40rPokqV61
 JTkN6LxjJV0jBVnwjrk+SJZW7hVFE6Vg53Rn9cCC50N/IlXOzAFZEPQJU1mA44YmLqxS8e74KcN
 7TP98X9frmxgnyiqGOoOpen/IWFxNqOmzNBNtNWlzKFWSj+f7t9+6QC+WV3v/awr21N3Nd6AUqJ
 Tt2zJCEOwo99T7AZ5cP4I450Z9Fn9qVbSVedZITYRl5jeBopBaBhZlD5yNByBxbE0Lg7iySGGNM
 /p9HJd7UYrR6Er/nevG/mrZsnRgnxuWPM/j0ZsXk3QYpBTFz+CRtA+WJrSbhDCnc0UA54u5mqhx
 x/k7Ra9+9q4AYQIjjjooDIOlOQiYRQ==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=68ff9915 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=9sl_EADGoQNm_DCWk-wA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_090854_429255_0F12AEC8 
X-CRM114-Status: GOOD (  22.38  )
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

On 10/27/2025 2:02 AM, Jani Nikula wrote:
> On Sat, 25 Oct 2025, "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
>> Standardize parameters ordering in some typical cases to minimize
>> confusion.
>>
>> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
>> ---
>>  Documentation/process/coding-style.rst | 48 ++++++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>
>> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
>> index d1a8e5465ed9..dde24148305c 100644
>> --- a/Documentation/process/coding-style.rst
>> +++ b/Documentation/process/coding-style.rst
>> @@ -523,6 +523,54 @@ below, compared to the **declaration** example above)::
>>  	...
>>   }
>>  
>> +6.2) Function parameters order
>> +------------------------------
>> +
>> +The order of parameters is important both for code generation and readability.
>> +Passing parameters in an unusual order is a common source of bugs. Listing
>> +them in standard widely adopted order helps to avoid confusion.
>> +
>> +Many ABIs put first function parameter and return value in R0. If your
>> +function returns one of its parameters, passing it at the very beginning
>> +would lead to a better code generation. For example::
>> +
>> +        void *memset64(uint64_t *s, uint64_t v, size_t count);
>> +        void *memcpy(void *dest, const void *src, size_t count);
>> +
>> +If your function doesn't propagate a parameter, but has a meaning of copying
>> +and/or processing data, the best practice is following the traditional order:
>> +destination, source, options, flags.
>> +
>> +for_each()-like iterators should take an enumerator the first. For example::
>> +
>> +        for_each_set_bit(bit, mask, nbits);
>> +                do_something(bit);
>> +
>> +        list_for_each_entry(pos, head, member);
>> +                do_something(pos);
>> +
>> +If function operates on a range or ranges of data, corresponding parameters
>> +may be described as ``start - end`` or ``start - size`` pairs. In both cases,
>> +the parameters should follow each other. For example::
>> +
>> +        int
>> +        check_range(unsigned long vstart, unsigned long vend,
>> +                    unsigned long kstart, unsigned long kend);
>> +
>> +        static inline void flush_icache_range(unsigned long start, unsigned long end);
>> +
>> +        static inline void flush_icache_user_page(struct vm_area_struct *vma,
>> +                                            struct page *page,
>> +                                            unsigned long addr, int len);
>> +
>> +Both ``start`` and ``end`` of the interval are inclusive.
>> +
>> +Describing intervals in order ``end - start`` is unfavorable. One notable
>> +example is the ``GENMASK(high, low)`` macro. While such a notation is popular
>> +in hardware context, particularly to describe registers structure, in context
>> +of software development it looks counter intuitive and confusing. Please switch
>> +to an equivalent ``BITS(low, high)`` version.
>> +
> 
> GENMASK when used for defining hardware registers is completely fine,
> and *much* easier to deal with when you cross check against the specs
> that almost invariably define high:low.

Not only that, there is no common definition of BITS

Defined in 7 files as a macro:
arch/arc/include/asm/disasm.h, line 32 (as a macro)
drivers/mfd/db8500-prcmu-regs.h, line 15 (as a macro)
drivers/net/wireless/intel/iwlwifi/fw/api/coex.h, line 14 (as a macro)
fs/select.c, line 415 (as a macro)
lib/zlib_inflate/inflate.c, line 232 (as a macro)
sound/core/oss/rate.c, line 28 (as a macro)
tools/perf/dlfilters/dlfilter-show-cycles.c, line 22 (as a macro)

Most of these do NOT have a (low, high) signature.

And GENMASK will throw a compile error if you swap the high and low:
#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))

IMO the real confusion with GENMASK(), which would be the same with the
proposed BITS(), is that without knowledge of the implementation, when looking
at an instance of usage you can't tell if the parameters are two bit numbers
or a start bit and number of bits.

/jeff

