Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAF11112242
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ct5P6mCjDlMhnQm+SSiZTYjNsbM3KmBoSNOdcv0MzNI=; b=NExeENsKAgadqC8zyd0v8uYaxr
	Tr2AKI8XAVo3luU425RNWldeflyQZqI8NWdklmkUztk3iQQS8PxLosGHgjyLXok+7m4ZJaiPxq9df
	HyNAmfSD1XhPmDMv6EQMNPr9zqFMe/a+/kOxZYuKr6vK4TUA65zeucOoR+Zh7uuf/6Zfuv8JVgil3
	IBl2vfSqk3hg+rkwr+VlcrdIH4b947/Cwc+VfIHAVfU2CFR+NZ0DxdGQWLRszFwaldvGKdGFnJvuX
	WhqI6X/BjmnLhkPJeBv+HYODO5ezBNueyaAAkzX8h3yc6mcYVM9YmZ9hlJli5ssTtOWOGTH9Hgrf6
	ZRtq4WPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84ZF-0000000GOLg-0ZMT;
	Wed, 01 Apr 2026 23:01:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Z8-0000000GOAo-2vZq;
	Wed, 01 Apr 2026 23:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ct5P6mCjDlMhnQm+SSiZTYjNsbM3KmBoSNOdcv0MzNI=; b=Mui9BGV3zjI1qm2hHQ98ZG+xsH
	idlnJJSL/7J+IkIR9C7fBZgSTdUxEQpgJGKFCqzjNKQgydoDDJ0B1sHxzKGBQ5V+njCJDkgvPnRb4
	QJuIKU50NbUdxI3wVa/lrW2SDpAXY6F3VByNKF2AtUn5S+V7PzXofJXF4ytm+PNwDU6WNuBhk+Rpu
	nvAcn6vkuXmbdxU+MxG5xjusz/90p0sDbXDC2ANCxRRDqYV8wnUmc6ET3ILRXErYc2jr4jPtOsw4n
	3QdA1owt/LkPdm0immeHEVehTUUnyzw/UH4NwFbxEXJ4h7A24xsr9CmsxjbqDx6EJfCCbaKoQMLZk
	j4R2Lm0g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Z3-00000001RTo-2G2w;
	Wed, 01 Apr 2026 23:01:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38036434F8;
	Wed,  1 Apr 2026 23:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E053C116C6;
	Wed,  1 Apr 2026 23:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084492;
	bh=eMEeyEmMsSEJqm/VBl3vGWpBMChoVMgzinIBBgfTPlE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=OqBr1JatdiUb2SuylVZI06g081Th5A5y+SBKA3HDmkQQ97vI3JEwhrSxvGwmRYfcT
	 gIgZiBk86U6zFl2xeAM5XAcNIndwN1BmcEoaR5ZvJYM7rqzMFz+1YsE+cz7axIJl2F
	 X039vepaYXzaeHv3h/+ZjOkTeUE+OJDVFelUi2CljqpO1nCMphf/t+AimoE63wwItA
	 oicrQfUBsr7nzOMQMl4np1MASYv6HNnj7KFB/AEG/OmevrCXcdXrzdV6/QynJ6W0qp
	 YB9ROCeUG7CfHzwZ7tLmPMeRsXJJ6hXMQDecGejA+SExP6VmmpiJ41ojKql7BZVzvj
	 qYYbOof6fOpDg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 26/33] docs: rust: quick-start: remove Gentoo "testing"
 note
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
In-Reply-To: <20260401114540.30108-27-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-27-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434468.73816.14590171380654521174.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=345; i=tamird@kernel.org;
 h=from:subject:message-id; bh=eMEeyEmMsSEJqm/VBl3vGWpBMChoVMgzinIBBgfTPlE=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7uuLFn5ysG844m+YOzU32yT5q2ddFFGwjjYK7z0s
 IHllYmrOyayMIhxMViKKbIkih7am556e49s5rvjMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEx1cxYjw/WVXWtWXt19ZdneHTnhLd/eMl7yEJ8655tqxfdHppWHvysx/PdbySo
 az7fibtaeiJbGk/N2qotN1tyw6K2c2vSuyp4IYx4A
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_000134_029883_A6078C33 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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

On Wed, 01 Apr 2026 13:45:33 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Gentoo does not need the "testing" note, since its packages are recent
> enough even in the stable branch [1][2].
> 
> Thus remove it to simplify the documentation.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

