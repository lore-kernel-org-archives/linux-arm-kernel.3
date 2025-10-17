Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986F3CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 05:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPM4mlpiishQWeQFEupQtI0yWXJaRSHmeNe+WZxInAk=; b=uf61w8g3dbyZn2UupuaA9fHLH9
	5vAvipIwx2TZF6Nn2bRuW+3hYfeJpRmnpboHPkeJkUZ6r/KVYQYGWruWaxRdEf+BkZ3rS2CuXyC+f
	vDKJ9gyJJwUenq+UXUdJU59z9DyTq5Y2LQ37dvNLZQ6bDeo6HP44ok5SES8tex5AjyXupqwpB1qXN
	z9u8pvO/SnPtUDW4bq2J9q9upFaMGe4xAMKcNcVBttsSXNdUjSfvS9zSbMiHGuf4TeY0MI1nAlW3e
	QSwqpEy/itQtM5sUGV9Xq57+bncjHTYVv362PH0eqhBjMpF9nzR5QVu1vJjMYolmEZxwOt5ErHGnE
	dwmG1e0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9cqk-00000006bTU-0TWm;
	Fri, 17 Oct 2025 05:17:58 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9cqh-00000006bSO-3OH2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 05:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760678273;
	bh=JPM4mlpiishQWeQFEupQtI0yWXJaRSHmeNe+WZxInAk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jPvbvixbXMKZqhbOdvGCGRfbQ6xz4XZW5OoEp834zvcbcUzeT0DEZQShCifFLvXH/
	 7VNXYSdU2G7KBQWNNJLvpdVm+M3neujB8Z53erIEdu1UJ2Ur/ZNsImsaJHlj4fM+hg
	 pXJ6iktIeSvvkWXkQePecL2LJGSXwTBivc0u1kUyxGFPoHq8uPoFGCjZLd1T70h288
	 XUtXbfrycVVCuJeeKaPuRXQTaJ2o8tU0V5LH3J2I97AhMweppeCmPHR8J6FZsKDRD8
	 AXTsyoypYXqYM3OOtceSmolxJvsYijbhLEvWUBCtsx2wbK42Z7FgkrL++vG1zbFzKz
	 wxyyk4y8wDU0A==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 882AA766F5;
	Fri, 17 Oct 2025 13:17:46 +0800 (AWST)
Message-ID: <57dffe112a461a218c7dab6bfc3b02967440cc77.camel@codeconstruct.com.au>
Subject: Re: [PATCH][v4] hung_task: Panic when there are more than N hung
 tasks at the same time
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: lirongqing <lirongqing@baidu.com>, Andrew Morton
 <akpm@linux-foundation.org>,  Lance Yang <lance.yang@linux.dev>, Masami
 Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, 	linux-kselftest@vger.kernel.org, Anshuman Khandual
 <anshuman.khandual@arm.com>,  Arnd Bergmann	 <arnd@arndb.de>, David
 Hildenbrand <david@redhat.com>, Florian Wesphal	 <fw@strlen.de>, Jakub
 Kacinski <kuba@kernel.org>, "Jason A . Donenfeld"	 <jason@zx2c4.com>, Joel
 Granados <joel.granados@kernel.org>, Joel Stanley	 <joel@jms.id.au>,
 Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,  Liam
 Howlett <liam.howlett@oracle.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Paul E . McKenney"	 <paulmck@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Petr Mladek
 <pmladek@suse.com>, Phil Auld <pauld@redhat.com>, Randy Dunlap
 <rdunlap@infradead.org>,  Russell King <linux@armlinux.org.uk>, Shuah Khan
 <shuah@kernel.org>, Simon Horman <horms@kernel.org>,  Stanislav Fomichev	
 <sdf@fomichev.me>, Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 17 Oct 2025 15:47:45 +1030
In-Reply-To: <20251015063615.2632-1-lirongqing@baidu.com>
References: <20251015063615.2632-1-lirongqing@baidu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_221756_060514_D98E3508 
X-CRM114-Status: GOOD (  14.61  )
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

On Wed, 2025-10-15 at 14:36 +0800, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
>=20
> Currently, when 'hung_task_panic' is enabled, the kernel panics
> immediately upon detecting the first hung task. However, some hung
> tasks are transient and allow system recovery, while persistent hangs
> should trigger a panic when accumulating beyond a threshold.
>=20
> Extend the 'hung_task_panic' sysctl to accept a threshold value
> specifying the number of hung tasks that must be detected before
> triggering a kernel panic. This provides finer control for environments
> where transient hangs may occur but persistent hangs should be fatal.
>=20
> The sysctl now accepts:
> - 0: don't panic (maintains original behavior)
> - 1: panic on first hung task (maintains original behavior)
> - N > 1: panic after N hung tasks are detected in a single scan
>=20
> This maintains backward compatibility while providing flexibility for
> different hang scenarios.
>=20
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Florian Wesphal <fw@strlen.de>
> Cc: Jakub Kacinski <kuba@kernel.org>
> Cc: Jason A. Donenfeld <jason@zx2c4.com>
> Cc: Joel Granados <joel.granados@kernel.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Lance Yang <lance.yang@linux.dev>
> Cc: Liam Howlett <liam.howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
> Cc: "Paul E . McKenney" <paulmck@kernel.org>
> Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Phil Auld <pauld@redhat.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Stanislav Fomichev <sdf@fomichev.me>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> ---
> diff with v3: comments modification, suggested by Lance, Masami, Randy an=
d Petr
> diff with v2: do not add a new sysctl, extend hung_task_panic, suggested =
by Kees Cook
>=20
> =C2=A0Documentation/admin-guide/kernel-parameters.txt=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 20 +++++++++++++-------
> =C2=A0Documentation/admin-guide/sysctl/kernel.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++++----
> =C2=A0arch/arm/configs/aspeed_g5_defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
2 +-

For the aspeed_g5_defconfig change:

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

