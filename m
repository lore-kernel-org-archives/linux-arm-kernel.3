Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D471112243
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqOq30gfiENKdb1rO9ZKcdE9ZfyKfK6S7Xrvje53HYM=; b=RVJKEIINU3tVvzv4+ifiafgmdh
	F0KhSx5FqZe3Z4kd3jqdjKlLqyE6buTt5j5l2sx9X+epH6AQODHlXPrPjqFLDsYqeNTwmMXEFxhGk
	9Hoc/WD9ZCOsKeV6O8cAumwS+sETcvVoXU2leLc7N9nNkhtqy8mQa1Lc/WchMBnMRnCfAENfV1p1m
	dWOSQObsX9rSYc91x5kpc9yIHOD4fNFNRkqkjJmZ6RlpqOe8SR3KPjVBwQIgBJ/4VKE2bQOrAF0tz
	N/nGdDiNYv7erkge+ilT0G7Yc68hKxXGOeAlxKneCRI2tl2JgALD/rQH0l546EsKlRiZmUXpk81W0
	2b0Sbp2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Z6-0000000GO8Z-1S08;
	Wed, 01 Apr 2026 23:01:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Z4-0000000GO3J-3Lgm;
	Wed, 01 Apr 2026 23:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UqOq30gfiENKdb1rO9ZKcdE9ZfyKfK6S7Xrvje53HYM=; b=paSXXIpg9NMMnUMY4jbcCQQNNC
	/78rS6uUYuA3/vhF88KLfVNhXGCUoRTRd9cvt8E1YTa+IZtQZXDRaZD70LM0XUnE7tcqsvX7Ud+2m
	r988cysYEtOYkIXureAutXIqeBeJcnYBk8AVo1nwrPrPUpVIW4L+jnOwB1eXsgRTMq9Tm2DRpyDFk
	LrNXetNdZUadc4PRANkT3R9luI6V7/3AmDqYkRTByQAuqnskdh/K2VVJ8vZv+cjvfP+U5zpS02oCy
	R1svA0Kwd/76p8q3AxtQ1ut13jONO9GZcU6wZMW3wb8HwrVAOfHZMJX9ncfhNs8hcPNJ9kiXs0Z9e
	MLWmcstQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Yy-00000001RQ8-2YCt;
	Wed, 01 Apr 2026 23:01:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02CF041906;
	Wed,  1 Apr 2026 23:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CC8C4CEF7;
	Wed,  1 Apr 2026 23:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084486;
	bh=0QBnjOf/a1gNT5EM5ReEkFxjICqiOXo4W5NTsRTeKQo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=T9tdpUNmBlbEPGldW4o1S6Lb7P25G/VI57Nx2JE9Q5s0svWpM92inyF0M8MT0RYGn
	 N+PeMsBowJab3sCv7iLX7l4hN35w3nDCNNktZYg1Xd6ALCbMslxNiJffCMZC/NRVBq
	 lQe9l9USpxDufqZqJNSIprajA9Pl6BVYg+GyMTm+nbxJTu9Ao4ExHvdLv/oASjIFyh
	 KMZGbGkUquUwt874wqpiO9uR8tVSAcIfPriDDE/J44GxjDQAaF5lcadIyNPdzqQVY+
	 1C0aSEbp72qTPwVzEumrnCaF8t5P49f5YewF/wGtKLell09jTNUCNOjr67/ACQupbL
	 GNnxVHyDQa2Tg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 25/33] docs: rust: quick-start: add Ubuntu 26.04 LTS
 and remove subsection title
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, 
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
In-Reply-To: <20260401114540.30108-26-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-26-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434467.73816.6022443418822181845.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=746; i=tamird@kernel.org;
 h=from:subject:message-id; bh=0QBnjOf/a1gNT5EM5ReEkFxjICqiOXo4W5NTsRTeKQo=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7t4ZiUrZk18eGdl7RsWcZ1FEtweXba9+qtcXAW71
 aqtV0R0TGRhEONisBRTZEkUPbQ3PfX2HtnMd8dh5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix0DHWMGLk4BmOpb3xj+ClVkB248oqWpYGZ350GB8Pw/fFJBB2Oc1s1VUv/4aOGjWIa/gttXX7n
 0/VJT5cxF/REb12mFLYo22znnYJqx4L1dlTHJHAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_000129_029450_E3619884 
X-CRM114-Status: GOOD (  11.07  )
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

On Wed, 01 Apr 2026 13:45:32 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Ubuntu 26.04 LTS (Resolute Raccoon) is scheduled to be released in a few
> weeks [1], and it has a recent enough Rust toolchain, just like Ubuntu
> 25.10 has [2][3].
> 
> We could update the title and the paragraph, but to simplify and to
> make it more consistent with the other distributions' sections, let's
> instead just remove that title. It will also reduce the differences
> later on to keep it updated. Eventually, when we remove the remaining
> subsection for older LTSs, Ubuntu should be a small section like the
> other distributions.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

