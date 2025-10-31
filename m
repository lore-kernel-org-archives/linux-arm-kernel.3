Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AB9CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUCtGCFwRvUEG4Bh7Y4FA/+ZjBJuHT2lo6zXAMV1QvY=; b=W+q4iH6zmELrCwP6jXLtBYedi2
	PgxvGJKYiJctMcF7i0G7Hl6YKMZuDAe/L2mw8I5DoBGWcNxTqOGIHHdYTS4H9lyN8Xry3rRj4aev4
	06qF8mu5kZ8okHFFE9Y8a7FJQm69Sw6Lguxcx+rmyb6ChJhlOrMBkRwIWSlaOl98jpMtVgrKZOqxz
	pyy3azCOgzkZtEnT5KmG/UbMGt19qFp4MwC10c5hOZODvrvdpNy5S3ZIu+7MuLUwvlcz+AuV2SMJb
	htRC+yE211Ox3KdjSwMAErb9FCpeaLzsQuXZVW8MOJ6PLBRDErgBq11YuOMYpfQxiXOR0e2RFSybz
	gdJb40Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpVG-00000006Aqx-1fmb;
	Fri, 31 Oct 2025 13:49:18 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpVD-00000006Aq9-2y7j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 13:49:17 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cyj0s3JBjz6L4ws;
	Fri, 31 Oct 2025 21:45:33 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id D81631402E9;
	Fri, 31 Oct 2025 21:49:11 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 31 Oct
 2025 13:49:11 +0000
Date: Fri, 31 Oct 2025 13:49:09 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ard Biesheuvel <ardb+git@google.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <herbert@gondor.apana.org.au>,
	<ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v4 08/21] lib/crc: Switch ARM and arm64 to 'ksimd'
 scoped guard API
Message-ID: <20251031134909.00006bf3@huawei.com>
In-Reply-To: <20251031103858.529530-31-ardb+git@google.com>
References: <20251031103858.529530-23-ardb+git@google.com>
	<20251031103858.529530-31-ardb+git@google.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_064915_931950_BCEC4C7B 
X-CRM114-Status: GOOD (  16.74  )
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

On Fri, 31 Oct 2025 11:39:07 +0100
Ard Biesheuvel <ardb+git@google.com> wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Before modifying the prototypes of kernel_neon_begin() and
> kernel_neon_end() to accommodate kernel mode FP/SIMD state buffers
> allocated on the stack, move arm64 to the new 'ksimd' scoped guard API,
> which encapsulates the calls to those functions.
> 
> For symmetry, do the same for 32-bit ARM too.
> 
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  lib/crc/arm/crc-t10dif.h   | 16 +++++-----------
>  lib/crc/arm/crc32.h        | 11 ++++-------
>  lib/crc/arm64/crc-t10dif.h | 16 +++++-----------
>  lib/crc/arm64/crc32.h      | 16 ++++++----------
>  4 files changed, 20 insertions(+), 39 deletions(-)
> 
> diff --git a/lib/crc/arm/crc-t10dif.h b/lib/crc/arm/crc-t10dif.h
> index 63441de5e3f1..aaeeab0defb5 100644
> --- a/lib/crc/arm/crc-t10dif.h
> +++ b/lib/crc/arm/crc-t10dif.h

>  static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
> @@ -20,21 +19,16 @@ asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
>  static inline u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
>  {
>  	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE) {
> -		if (static_branch_likely(&have_pmull)) {
> -			if (likely(may_use_simd())) {
> -				kernel_neon_begin();
> -				crc = crc_t10dif_pmull64(crc, data, length);
> -				kernel_neon_end();
> -				return crc;
> -			}
> +		if (static_branch_likely(&have_pmull) && likely(may_use_simd())) {
> +			scoped_ksimd()
> +				return crc_t10dif_pmull64(crc, data, length);

>  		} else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
>  			   static_branch_likely(&have_neon) &&
>  			   likely(may_use_simd())) {

I briefly thought this was a functional change but it's not because
of may_use_simd() being something that isn't going to change between
the two evaluations.  

Would it hurt at all to pull that up to be
	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE && likely(may_use_simd())) {
		if (static_branch_likely(&have_pmull)) {
			scoped_ksimd()
				return crc_t10dif_pmull64(crc, data, length);

 		} else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
 			   static_branch_likely(&have_neon)) {
		...

?


