Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A869C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 08:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PzrthrLkW4R8v6fQu4F9Z0+3j1oj2AKD6gdwJR3+YjY=; b=ycWxu4EwfmWTu5
	H2WoafMsvP5PkKhsTGSQHtGRmGrylE8kAnypKoajpKYuBvZrT1IFNuZ1ZI69lXsevtr0qz9FJ2TFp
	CA6SQ1AnUqQFcEri67dJzmsZlpPQ7YPWxXm8jDCt5Oa2IWwjbIRI8qCd3e/KsweIy4FEps5qrCA/D
	rxvaoCHI5BTf7Bxmyg5hxBtOpCi4GxCYd7VWqy5MwCGMMSsvpgJlm18Km2hvDuPnAOTH8wD56MhMi
	L4AmDd6g3bs+4OmsSq7WtorzCFoH3Nn4Y+J3rDty1sCLGoZ3Hc9HVIVW+yDXaPVLjTi8+J9HHoSCC
	2PzCrLFtlVIUgWBYN1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teVKl-0000000DWdp-0W7X;
	Sun, 02 Feb 2025 08:28:03 +0000
Received: from out-13.smtpout.orange.fr ([193.252.22.13] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teVJP-0000000DWaS-4BGN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 08:26:41 +0000
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id eVIrtwgZkM6ZbeVIwtQSlb; Sun, 02 Feb 2025 09:26:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738484790;
	bh=PzrthrLkW4R8v6fQu4F9Z0+3j1oj2AKD6gdwJR3+YjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Er14Dtt3+zfNicUpvicGUD6Vdf5OQJsDpkGPvY598Y41dT4BnaZJiPDU0Z9Am45FA
	 rt5j0Pz9QRRm/z1mN2d3bb772DaBoyfWVgR/c2muJ80mlphsG3rFguogAus2nGUtIq
	 SMzYzyRktW1gkaZRsNIAjVI989zqNQFAkzvJwc+c2MnnUIjwGsK+qKlmGw7er9lbI/
	 pIddcTj+3U4H8qpjYBDjjnhQpTydKf0sXi6FZhIfK4nK0TsNcNc/SvIiJquLWgQ3LP
	 O1s8+gqFJZHGsDqv+oFJDfLSh35L6j+QPDYeBSJJCpC011UxtV+bXz1kDtn/PestXd
	 +aDON8InPsqFw==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 Feb 2025 09:26:30 +0100
X-ME-IP: 124.33.176.97
Message-ID: <e20a177a-30cd-4088-89e1-b479aba1356c@wanadoo.fr>
Date: Sun, 2 Feb 2025 17:26:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH treewide v2 1/3] bitfield: Add non-constant
 field_{prep,get}() helpers
To: Geert Uytterhoeven <geert+renesas@glider.be>
References: <cover.1738329458.git.geert+renesas@glider.be>
 <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_002640_453432_EFF1E84C 
X-CRM114-Status: GOOD (  15.66  )
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Crt Mori <cmo@melexis.com>, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shan-Chun Hung <schung@nuvoton.com>, linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Herbert Xu <herbert@gondor.apana.org.au>, Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>, qat-linux@intel.com, Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>, Jacky Huang <ychuang3@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Alex Elder <elder@ieee.org>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 31/01/2025 at 22:46, Geert Uytterhoeven wrote:
> The existing FIELD_{GET,PREP}() macros are limited to compile-time
> constants.  However, it is very common to prepare or extract bitfield
> elements where the bitfield mask is not a compile-time constant.

Why is it that the existing FIELD_{GET,PREP}() macros must be limited to
compile time constants? Instead of creating another variant for
non-constant bitfields, wouldn't it be better to make the existing macro
accept both?

As far as I can see, only __BUILD_BUG_ON_NOT_POWER_OF_2()  and
__BF_FIELD_CHECK() need to be adjusted. I am thinking of this:

diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index 63928f173223..c6bedab862d1 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -8,6 +8,7 @@
 #define _LINUX_BITFIELD_H

 #include <linux/build_bug.h>
+#include <linux/compiler.h>
 #include <asm/byteorder.h>

 /*
@@ -62,15 +63,13 @@

 #define __BF_FIELD_CHECK(_mask, _reg, _val, _pfx)                      \
        ({                                                              \
-               BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
-                                _pfx "mask is not constant");          \
-               BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
-               BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
-                                ~((_mask) >> __bf_shf(_mask)) &        \
-                                       (0 + (_val)) : 0,               \
+               BUILD_BUG_ON_MSG(statically_true((_mask) == 0),         \
+                                _pfx "mask is zero");                  \
+               BUILD_BUG_ON_MSG(statically_true(~((_mask) >>
__bf_shf(_mask)) & \
+                                                (0 + (_val))),         \
                                 _pfx "value too large for the field"); \
-               BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
-                                __bf_cast_unsigned(_reg, ~0ull),       \
+
BUILD_BUG_ON_MSG(statically_true(__bf_cast_unsigned(_mask, _mask) > \
+
__bf_cast_unsigned(_reg, ~0ull)), \
                                 _pfx "type of reg too small for mask"); \
                __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
                                              (1ULL << __bf_shf(_mask))); \
diff --git a/include/linux/build_bug.h b/include/linux/build_bug.h
index 3aa3640f8c18..3b8055ebb55f 100644
--- a/include/linux/build_bug.h
+++ b/include/linux/build_bug.h
@@ -18,9 +18,9 @@

 /* Force a compilation error if a constant expression is not a power of
2 */
 #define __BUILD_BUG_ON_NOT_POWER_OF_2(n)       \
-       BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
+       BUILD_BUG_ON(statically_true((n) & ((n) - 1)))
 #define BUILD_BUG_ON_NOT_POWER_OF_2(n)                 \
-       BUILD_BUG_ON((n) == 0 || (((n) & ((n) - 1)) != 0))
+       BUILD_BUG_ON(statically_true(!(n) || ((n) & ((n) - 1))))

 /*
  * BUILD_BUG_ON_INVALID() permits the compiler to check the validity of the


> To avoid this limitation, the AT91 clock driver and several other
> drivers already have their own non-const field_{prep,get}() macros.
> Make them available for general use by consolidating them in
> <linux/bitfield.h>, and improve them slightly:
>   1. Avoid evaluating macro parameters more than once,
>   2. Replace "ffs() - 1" by "__ffs()",
>   3. Support 64-bit use on 32-bit architectures.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

(...)


Yours sincerely,
Vincent Mailhol


