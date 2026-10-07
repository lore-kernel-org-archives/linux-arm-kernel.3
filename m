Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83E6CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 20:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xhLP80GXVtS6CE3RvF7MHseUyKQXwhqc65xg2C8JDq8=; b=eTj+q3TsgDcz1Ij/3a4AIhziop
	1C5d12GQ+u8yjihXnnxJTU7j2SySjIsCs25ZWhqE5s2314s2/jChf4DZvUlLd/ws+xwutSg4SzOWr
	5pZAuP4LcxdafoEigWNYKBXZqB2/NYES8OVCCjjpFF5Os4uRFmcyOI1OeM8qV1nN5C9ErSLrV8IH6
	YgJ+V91lG62geHWDrGSVFaceyPwnSePToJCtHGxY8wTYRQRVdLrYuhzYDGynPazmqPQmaIk1fBNn7
	7qrkcSVegCr/dawI8VRjr2rMeB97YDbhVy9lOfI+WSv28IiaUJbO7YFeNkIQCZR3Wq+f8siSt3zkY
	R6vfhX6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYAw-000000037sc-2yDg;
	Wed, 07 Oct 2026 20:23:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYAu-000000037sN-3vE0;
	Wed, 07 Oct 2026 20:23:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5390C42D92;
	Wed,  7 Oct 2026 20:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36BBE1F000FF;
	Wed,  7 Oct 2026 20:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791404620;
	bh=xhLP80GXVtS6CE3RvF7MHseUyKQXwhqc65xg2C8JDq8=;
	h=Date:From:To:Cc:Subject:Reply-To;
	b=j8RcSFVTqWJYNtcD5cHQrg/tBRXhIiK0v0z6JiB9gxdGY8hdAmF1jYl8QxNOeIRuX
	 9ypyelNNLYJNylDJIA2yqEtxUKGahYoeGYRv6U4Qza8frbpi26hhxKj7yOqbnf9V1+
	 xv2WDRFBRkIOGQYDuprqK0tbidn0CWNR4Vj6oSFsjiavyl9WrEapvnsJUP3yRveVi+
	 s4hDL3jy57ZALN+qPx2U5NXiastyEfGt+ly9IxDmwveWmVHhkK9dQ17bNpp5l1hliZ
	 hNqji7Xy4ZjNECzFan8mf70UD2A2PaLygusmXZTreARPxn+qgXyuV0pI6eSwBL4VaB
	 3Hk12uTt6NfEQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D9780CE0D79; Wed,  7 Oct 2026 13:23:39 -0700 (PDT)
Date: Wed, 7 Oct 2026 13:23:39 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT RFC PULL] Fix double dereference in TP_printk() in usb mtu3
Message-ID: <84064d39-6f44-4b4b-98f8-895a0294a3cf@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello, Linus,

Please pull this urgent fix for a tracing splat in usb mtu3, which is a
pre-existing bug that can corrupt tracing output, but which was exposed
this cycle by additional checking that was added to the tracing subsystem.

  git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/usb-mtu3.2026.10.06a
  # HEAD: cfb3293c4573289f11f913611f530ea6b1926d67: usb: mtu3: Fix double dereference in TP_printk (2026-09-29 17:26:50 -0700)

----------------------------------------------------------------
usb: mtu3: Fix a double-dereference splat in TP_printk

This splat is reporting a double-dereference that can result in garbage
traces being dumped due to the possibility of the TP_printk() being
executed without the benefit of main memory being present.  The fix is to
move the extra dereference from TP_printk() time to TP_fast_assign() time.

----------------------------------------------------------------
Vladimir Murzin (1):
      usb: mtu3: Fix double dereference in TP_printk

 drivers/usb/mtu3/mtu3_trace.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

