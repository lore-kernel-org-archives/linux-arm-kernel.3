Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C792DC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRzDa/r/YmBt+wlpaMQ61Gn8ZKl0NmHc9HVdDTLA0QU=; b=hNQGqlmqLDANv2gLDtf04CHRjz
	KQ0awimLg4YqzWnEzQw5QAinQ24mvLNguzE3QAXc7IpjtAwnnuE7CdCpig2mUr/GnVnUZd2vwoydh
	xSD0xL/15BzevcKCNuHw1numYZ3uQ3vMJjYcbbfRgdCES2wo85tktx1ELgJUh60zcm/O7ycuVxVuF
	zmSlQ9kCVHwmJXLz5Arg+jUqkBO4EkDKqryyKTUBfXG+4M+odrLYHlB2wJC0FUNAhDsANAZd3GZF2
	qq0VoKTiOaUVY6CnI0w0glNYD7AtX9D0E/egZZYbk1PrGPL5+r9Zqe3dKocRmlcItmxvoRBOMz42/
	7MexC1LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1Kc-00000007Vqe-1wJO;
	Wed, 29 Jul 2026 10:16:10 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1KZ-00000007Vps-23vX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 10:16:09 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so1027742a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 03:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785320166; x=1785924966; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRzDa/r/YmBt+wlpaMQ61Gn8ZKl0NmHc9HVdDTLA0QU=;
        b=Pi3vrH8Ntt1lgC/ltIywsG1m0MPvwPfGEf1r5OZH5xSXsuJOVf93qMvuaQpH7zbIji
         4q+zOylgMGx/ze5QUBnfvOsQyTR8259nxJniWkI19Q7SuHy8EyMcH8CSHHKKFC0mxuDu
         PA6/AJ0mmzkKKN7G69brKb7hNrxUFedzuBJzzstjXQDqNYm02mVFNYgB8kIIjmy+GcsH
         ItWnXG04dMK0DfRTgOa8haYA2ehzlVy0kMGZu6R4Py5xrAWfoIxOsxU+g1BWZ20TeRl6
         s/oDmMNWiiRvuBwYwinzNesmvxWhSvqkP57mZySlAF21CoGx1P9Iy24aHXTIwqUZD4la
         OPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785320166; x=1785924966;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRzDa/r/YmBt+wlpaMQ61Gn8ZKl0NmHc9HVdDTLA0QU=;
        b=Gwga3nX9yvC8xU8d5rmHnNDauZ8QKzFgkP7kZc1DHUr9ViNWkhi+VhGs5ZZDWQU/AU
         WpUFC+0ThAQ/SunkNHKJQrPkLXi4UdJTn1EJ95Aa10/OVRMXyB/+9aqS/gn2oThJqTCr
         BOjsGBH/8GIi5tZ12w40EK1liH99zBGhJHRLkJpQ7zRr+65sFneWPCql8dj8Cxrny/jz
         Gte5Ba0ZpPQBFVNz4Q/54P0VVUVKqBZE1uFSk+a2+ASzsu2aM5u1FvzUHP/eLWukcog3
         aXOAzmCPKRCRsKwurPHFd5i0rTNM6nZq9RjBeBCDIkJepftA7VzSU8yfWP2O9l4D72be
         1KJw==
X-Forwarded-Encrypted: i=1; AHgh+Rpz477892oNMzpFALuPy0xxhzW7hEBkK0tUo9ghbLvNXJT+Z2aWsl+VP9lP/10Yvl4PPyKh3dURU0/JpPASjf5F@lists.infradead.org
X-Gm-Message-State: AOJu0YxhlRNKglyze9gJ/7uiG2Pbd+ywZxz1PBTduiVjzKKID1YEqS8j
	fe8beGKGmqYMpOo9leYt2/CWTIHgghOBuWFBJnxlwcNS4pHHuUvgt/U/cLArX+32LpE=
X-Gm-Gg: AR+sD127POHgmqu6JFt3sKwYo6qE8d/PNTX3hk+HIqwXJWrrptFmNE5jSiGLsbrAkPU
	xxOC4DGRajTp2DQeOTsb//SPv78cNFWWTWibqMJl1FO7iQ7DYfa5DQGAjmdgx+dwJ1lLFKUvpea
	V8GH3cbqDMx65ma/xGirRVl2oHpjtJ3XITkb7tHWC2+SleZ2i+aO+KjhBL8acZXPdCpBFG5M+Cn
	orMT7QIFoX7o7Xd0VoLic+84LQaTRTYtw1+V23U4XLENg0tcNi+Rx/1xJfr823hU5kPBZJ4FWy6
	UvK/LCPLB1QUdc6Ie6M3JNRD/kV57kMW/c2XeewVyxr3255DHS8XHJpl30LSsZFPdAnmsVbv60n
	Agv7iZCRhndYIl3lQvFNNRUi6AnfP6JWt0RIVh84OScDNcBpJXO2iWe8MueIWNbaOusst/qrl7u
	giJHm10IxOsmhdAH3tSjb7+DS/Exh/bzuCj/VOBncBA1wXZ4ctEpcZNGuvFt7pCjx5tQ==
X-Received: by 2002:a05:6402:1e8e:b0:69f:d41c:fef with SMTP id 4fb4d7f45d1cf-6a034a0861dmr2962192a12.6.1785320165584;
        Wed, 29 Jul 2026 03:16:05 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050be3a33sm650268a12.10.2026.07.29.03.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:16:03 -0700 (PDT)
Message-ID: <d748b44b-d81c-4ea7-ac7d-03a3c72e9e14@linaro.org>
Date: Wed, 29 Jul 2026 11:16:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] perf hisi-ptt: Fix PTT trace TLP header parsing
To: Sizhe Liu <liusizhe5@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linuxarm@huawei.com, prime.zeng@hisilicon.com,
 wuyifan50@huawei.com, rostedt@goodmis.org, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, corbet@lwn.net, skhan@linuxfoundation.org,
 bhelgaas@google.com, yangyccccc@gmail.com, jic23@kernel.org,
 john.g.garry@oracle.com, will@kernel.org, mike.leach@arm.com,
 leo.yan@linux.dev, peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, wangyushan12@huawei.com
References: <20260729060220.624250-1-liusizhe5@huawei.com>
 <20260729060220.624250-3-liusizhe5@huawei.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260729060220.624250-3-liusizhe5@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_031607_611170_FE52D30A 
X-CRM114-Status: GOOD (  31.75  )
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



On 29/07/2026 7:02 am, Sizhe Liu wrote:
> TLP Headers traced by HiSilicon PCIe tune and trace device (PTT) in
> 4DW format are shown in the document as below:
> bits [31:30] [ 29:25 ][24][23][22][21][    20:11   ][    10:0    ]
>       |-----|---------|---|---|---|---|-------------|-------------|
> DW0  [ Fmt ][  Type  ][T9][T8][TH][SO][   Length   ][    Time    ]
> DW1  [                     Header DW1                            ]
> DW2  [                     Header DW2                            ]
> DW3  [                     Header DW3                            ]
> 
> Problem:
> The DW0 bit field layout of the hisi_ptt_4dw union does not match the
> actual bit ordering in little-endian memory, causing incorrect field
> decoding.
> 
> Test on Kunpeng 930 SOC, generating data flow with `iperf` commands:
> - server side:
>      iperf -s
> - client side:
>      iperf -c $ip_addr -t 30
> 
> Trace the TLP headers with hisi_ptt on server side at the same time:
>    perf record -e hisi_ptt12_0/type=4,filter=0x05101,direction=2,format=0/ \
>    --max-size 50M -o perf.data &
> The trace aims to capture completion TLPs, learn more in the document:
>    https://docs.kernel.org/trace/hisi-ptt.html
> 
> Decode perf.data with hisi_ptt decoder:
>    perf report -D
> 
> The hisi_ptt decoder produces the following result:
> [...perf headers and other information]
> . ... HISI PTT data: size 8388608 bytes
> .  00000000: 68 87 20 94                                 Format 3 Type 1a T9 0 T8 1 TH 1 SO 1 Length 10 Time 4a1
> .  00000004: 40 00 00 00                                 Header DW1
> .  00000008: 40 00 01 51                                 Header DW2
> .  0000000c: 00 00 00 00                                 Header DW3
> [...other hisi_ptt TLP headers]
> 
> According to PCIe r5.0 2.2.1, the Fmt & Type of Cpl/CplD is supposed to be
> 8b'00001010' / 8b'01001010'
> However, the Format & Type decoder analyzing result is 8b'01111010'.
> It does not match field encodings of any TLP messages.
> 
> Correct decoder result should be:
> [...perf headers and other information]
> . ... HISI PTT data: size 8388608 bytes
> .  00000000: 94 20 87 68                                 Format 2 Type a T9 0 T8 0 TH 0 SO 1 Length 10 Time 768
> .  00000004: 00 00 00 40                                 Header DW1
> .  00000008: 51 01 00 40                                 Header DW2
> .  0000000c: 00 00 00 00                                 Header DW3
> [...other hisi_ptt TLP headers]
> 
> To solve the problem:
> 1. Drop the union and C bitfield struct, store the raw DW value in
> a plain uint32_t, and extract the fields with FIELD_GET() against
> GENMASK/BIT masks declared in the header so they can be reused by
> other translation units. The masks are portable across endianness and
> compilers.
> 
> 2. Print all DW hex values in big-endian byte order for readability,
> matching the bit field layout shown in the 4DW format diagram.
> 
> Cc: stable@vger.kernel.org
> Fixes: 5e91e57e6809 ("perf auxtrace arm64: Add support for parsing HiSilicon PCIe Trace packet")
> Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
> ---
>   Documentation/trace/hisi-ptt.rst              | 28 +++++------
>   .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 46 +++++++++----------
>   .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   | 12 +++++
>   3 files changed, 49 insertions(+), 37 deletions(-)
> 
> diff --git a/Documentation/trace/hisi-ptt.rst b/Documentation/trace/hisi-ptt.rst
> index 6eef28ebb0c7..f6a2655f99e5 100644
> --- a/Documentation/trace/hisi-ptt.rst
> +++ b/Documentation/trace/hisi-ptt.rst
> @@ -285,20 +285,20 @@ according to the format described previously (take 8DW as an example):
>       [...perf headers and other information]
>       . ... HISI PTT data: size 4194304 bytes
>       .  00000000: 00 00 00 00                                 Prefix
> -    .  00000004: 01 00 00 60                                 Header DW0
> -    .  00000008: 0f 1e 00 01                                 Header DW1
> -    .  0000000c: 04 00 00 00                                 Header DW2
> -    .  00000010: 40 00 81 02                                 Header DW3
> -    .  00000014: 33 c0 04 00                                 Time
> +    .  00000004: 60 00 00 01                                 Header DW0
> +    .  00000008: 01 00 1e 0f                                 Header DW1
> +    .  0000000c: 00 00 00 04                                 Header DW2
> +    .  00000010: 02 81 00 40                                 Header DW3
> +    .  00000014: 00 04 c0 33                                 Time
>       .  00000020: 00 00 00 00                                 Prefix
> -    .  00000024: 01 00 00 60                                 Header DW0
> -    .  00000028: 0f 1e 00 01                                 Header DW1
> -    .  0000002c: 04 00 00 00                                 Header DW2
> -    .  00000030: 40 00 81 02                                 Header DW3
> -    .  00000034: 02 00 00 00                                 Time
> +    .  00000024: 60 00 00 01                                 Header DW0
> +    .  00000028: 01 00 1e 0f                                 Header DW1
> +    .  0000002c: 00 00 00 04                                 Header DW2
> +    .  00000030: 02 81 00 40                                 Header DW3
> +    .  00000034: 00 00 00 02                                 Time
>       .  00000040: 00 00 00 00                                 Prefix
> -    .  00000044: 01 00 00 60                                 Header DW0
> -    .  00000048: 0f 1e 00 01                                 Header DW1
> -    .  0000004c: 04 00 00 00                                 Header DW2
> -    .  00000050: 40 00 81 02                                 Header DW3
> +    .  00000044: 60 00 00 01                                 Header DW0
> +    .  00000048: 01 00 1e 0f                                 Header DW1
> +    .  0000004c: 00 00 00 04                                 Header DW2
> +    .  00000050: 02 81 00 40                                 Header DW3
>       [...]
> diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
> index c48b2ce7c4a3..c1e169561087 100644
> --- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
> +++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
> @@ -10,6 +10,7 @@
>   #include <endian.h>
>   #include <byteswap.h>
>   #include <linux/bitops.h>
> +#include <linux/kernel.h>
>   #include <stdarg.h>
>   
>   #include "../color.h"
> @@ -73,29 +74,20 @@ static const char * const hisi_ptt_4dw_pkt_field_name[] = {
>   	[HISI_PTT_4DW_HEAD3]	= "Header DW3",
>   };
>   
> -union hisi_ptt_4dw {
> -	struct {
> -		uint32_t format : 2;
> -		uint32_t type : 5;
> -		uint32_t t9 : 1;
> -		uint32_t t8 : 1;
> -		uint32_t th : 1;
> -		uint32_t so : 1;
> -		uint32_t len : 10;
> -		uint32_t time : 11;
> -	};
> -	uint32_t value;
> -};
> -
>   static void hisi_ptt_print_pkt(const unsigned char *buf, int pos, const char *desc)
>   {
>   	const char *color = PERF_COLOR_BLUE;
> +	uint32_t value;
> +	uint8_t byte;
>   	int i;
>   
> +	value = le32_to_cpu(*(__le32 *)(buf + pos));
>   	printf(".");
>   	color_fprintf(stdout, color, "  %08x: ", pos);
> -	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++)
> -		color_fprintf(stdout, color, "%02x ", buf[pos + i]);
> +	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++) {
> +		byte = (value >> (24 - i * 8)) & 0xFF;
> +		color_fprintf(stdout, color, "%02x ", byte);
> +	}
>   	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
>   		color_fprintf(stdout, color, "   ");
>   	color_fprintf(stdout, color, "  %s\n", desc);
> @@ -122,22 +114,30 @@ static int hisi_ptt_8dw_pkt_desc(const unsigned char *buf, int pos)
>   static void hisi_ptt_4dw_print_dw0(const unsigned char *buf, int pos)
>   {
>   	const char *color = PERF_COLOR_BLUE;
> -	union hisi_ptt_4dw dw0;
> +	uint8_t byte;
> +	uint32_t dw;
>   	int i;
>   
> -	dw0.value = *(uint32_t *)(buf + pos);
> +	dw = le32_to_cpu(*(__le32 *)(buf + pos));

Sashiko and the comment in generic.h say to use get_unaligned_le32() for 
unaligned data. It looks like this always is aligned but it's not 
enforced by the function, so to avoid anyone wondering if it's correct I 
would just use get_unaligned_le32().

With that:

Reviewed-by: James Clark <james.clark@linaro.org>

Sashiko also says there is another endianess issue in 
hisi_ptt_check_packet_type(). Up to you whether you want to fix it or 
not: 
https://sashiko.dev/#/patchset/20260729060220.624250-1-liusizhe5%40huawei.com

>   	printf(".");
>   	color_fprintf(stdout, color, "  %08x: ", pos);
> -	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++)
> -		color_fprintf(stdout, color, "%02x ", buf[pos + i]);
> +	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++) {
> +		byte = (dw >> (24 - i * 8)) & 0xFF;
> +		color_fprintf(stdout, color, "%02x ", byte);
> +	}
>   	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
>   		color_fprintf(stdout, color, "   ");
>   
>   	color_fprintf(stdout, color,
>   		      "  %s %x %s %x %s %x %s %x %s %x %s %x %s %x %s %x\n",
> -		      "Format", dw0.format, "Type", dw0.type, "T9", dw0.t9,
> -		      "T8", dw0.t8, "TH", dw0.th, "SO", dw0.so, "Length",
> -		      dw0.len, "Time", dw0.time);
> +		      "Format", FIELD_GET(HISI_PTT_HEAD0_4DW_FORMAT, dw),
> +		      "Type", FIELD_GET(HISI_PTT_HEAD0_4DW_TYPE, dw),
> +		      "T9", FIELD_GET(HISI_PTT_HEAD0_4DW_T9, dw),
> +		      "T8", FIELD_GET(HISI_PTT_HEAD0_4DW_T8, dw),
> +		      "TH", FIELD_GET(HISI_PTT_HEAD0_4DW_TH, dw),
> +		      "SO", FIELD_GET(HISI_PTT_HEAD0_4DW_SO, dw),
> +		      "Length", FIELD_GET(HISI_PTT_HEAD0_4DW_LEN, dw),
> +		      "Time", FIELD_GET(HISI_PTT_HEAD0_4DW_TIME, dw));
>   }
>   
>   static int hisi_ptt_4dw_pkt_desc(const unsigned char *buf, int pos)
> diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
> index 6772b16b817b..3b349fcc24ae 100644
> --- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
> +++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
> @@ -9,12 +9,24 @@
>   
>   #include <stddef.h>
>   #include <stdint.h>
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
>   
>   #define HISI_PTT_8DW_CHECK_MASK		GENMASK(31, 11)
>   #define HISI_PTT_IS_8DW_PKT		GENMASK(31, 11)
>   #define HISI_PTT_MAX_SPACE_LEN		10
>   #define HISI_PTT_FIELD_LENGTH		4
>   
> +/* Header DW0 fields for 4DW format */
> +#define HISI_PTT_HEAD0_4DW_TIME		GENMASK_U32(10, 0)
> +#define HISI_PTT_HEAD0_4DW_LEN		GENMASK_U32(20, 11)
> +#define HISI_PTT_HEAD0_4DW_SO		BIT_U32(21)
> +#define HISI_PTT_HEAD0_4DW_TH		BIT_U32(22)
> +#define HISI_PTT_HEAD0_4DW_T8		BIT_U32(23)
> +#define HISI_PTT_HEAD0_4DW_T9		BIT_U32(24)
> +#define HISI_PTT_HEAD0_4DW_TYPE		GENMASK_U32(29, 25)
> +#define HISI_PTT_HEAD0_4DW_FORMAT	GENMASK_U32(31, 30)
> +
>   enum hisi_ptt_pkt_type {
>   	HISI_PTT_4DW_PKT,
>   	HISI_PTT_8DW_PKT,


