Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B0FCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 22:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvXp+1P6AtbDNcD1+SpBwuR8V5/iTedBIFhFKp1j9iI=; b=hua7qD/iXV8RaWKbGa3xul958P
	wZGhWLl3fQlbQ40rpCcj/CJP5Cp7rA6ifGXwz096Nwi1Neg46eo+GFGXituWZ3us/tQpngmNA6Qxd
	EYQyFdeLeghbdNuVyLN3Xv3uPk5MAC32OS59bQLXsHsYzsnjkxG0sUGx+tih9Yr7hCDw+BPEik3Yp
	wn3soLQcOvsWQhL3Rvx0cmwWqSAGg6QmlkFJKtjBgsU3ClcFB4/fmqEboqVHx96LgD2VEzMafcrif
	Z42XONz679hC6Vp36+ztnw2cyA2MBgzYt9SKbW18Ii10cQ+TqLLpHyPMOQn0/bXYZujDgtTEbaVfo
	2iiK92ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWiOz-00000004UYJ-1Itw;
	Mon, 08 Jun 2026 22:25:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWiOy-00000004UXj-16et
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 22:25:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 809736001D;
	Mon,  8 Jun 2026 22:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEA41F00893;
	Mon,  8 Jun 2026 22:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780957499;
	bh=KvXp+1P6AtbDNcD1+SpBwuR8V5/iTedBIFhFKp1j9iI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X+EcnwjkPuRJ8wtgQyMIykB9IZbqA3iyPCCGBQlQIS6jFuRkpYm1AcZ+R6NMq8nVV
	 O+TXEs38C6ZO+x/YIvyDXyDm5EjVpaJ34k1+ijO7lbKpTogVyRkAzG0GkQCGVl+7Ze
	 eT3esN8W5BINCMiqg4VvIkNH/yGURLwUoJbo+lPzAvPHu52dctsA4lIbTRAQFcTSAK
	 c9uG9/eAZ5gcjQnzkhkqshtX4gp11jVeiKAC56wKE3M7sa/LehiexW20KrXcNOVehB
	 byueeGgPgynrOIvreLU9v9XHwn0nwFmnK/N/AO5kqtkK9/NeR5aZ1nXL6JBoq6lU9h
	 Tn0QeCn7l1Xbg==
From: Danilo Krummrich <dakr@kernel.org>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rahul Bukte <rahul.bukte@sony.com>,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>,
	linux-modules@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Sumit Gupta <sumitg@nvidia.com>
Subject: Re: [PATCH v5 0/4] Enable sysfs module symlink for more built-in drivers
Date: Tue,  9 Jun 2026 00:24:48 +0200
Message-ID: <20260608222448.1353773-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On Mon, 18 May 2026 19:19:56 +0900, Shashank Balaji wrote:
> [PATCH v5 0/4] Enable sysfs module symlink for more built-in drivers

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/4] soc/tegra: cbb: Move driver registration from pure_initcall to core_initcall
      commit: cd6e95e7ab29
[2/4] kernel: param: initialize module_kset in a pure_initcall
      commit: c82dfce47833
[3/4] coresight: pass THIS_MODULE implicitly through a macro
      commit: efc22b3f89a3
[4/4] driver core: platform: set mod_name in driver registration
      commit: a7a7dc5c46a0

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are in the driver-core-testing branch and will be promoted to
driver-core-next after validation.

