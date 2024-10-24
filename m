Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77172CE8E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2b9Czd73JLCMwNCovJfbkCGlTdVoBOOUqvpNcnOijE=; b=Snn7+GSB8rGBcL2uyfm4+OOw7W
	uIGJq8G2JBw+kqPYLjElOqIIaBdivL0Gzi6b3OI+3MNeUQtAXu+aHoT7vAIurAxfcsJKaaybONI1J
	fcqAgbZfAm1fhe8vMpBNS5/gsjQVuvDdbNdCtBKWisaZBgWMNDR7KXY+uTzwdsVKdV7P62DUKXFOf
	sPKuf4z6uEPi24xC/1pMPjE99TKxWDE/sUuLX38v8nfEFaoCye8HaJrjXYY012lngtP9guqdmp4a4
	0ndf9cV0HgpECRT1kbF0DM2UB24hCu/wrGet4R40yOT0UGp9Ds/uGxnPmTTDyyTEI1lIQ0t90mTWc
	iGzwvA4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40IM-000000011LV-1cqI;
	Thu, 24 Oct 2024 16:02:42 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4096-00000000ziu-35xv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 15:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729785189; x=1761321189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2qnd2i2UONcjZVkzIcTSxS7pJORJ7ofkM+P7wpTWR88=;
  b=O1ArimrtiOFyiXWMdPnF1aKrQFQAKz+pcQOZSurxcqfzKJbF0ZdE4pjw
   h17CmqXNjI1hy95eDiEE6f6NUZB5dmWdSQ7ZrPvd0IcY2HfroHH4x2rTc
   KaNAywl6ssiWjWzTqKQaVKBgTs4qy4iqSgxK95E1ntUyuJRgfJ0LEYwv7
   nhR9r4mLRALgMNX9Tt9OBwqKBepZzUqiox0njWtQdu71xvJrjH7RsJS44
   fjcTB3Taaj4IYf5EnGd0tnDho8kYvUJvxcKBX8DCRLFDO2qwkSxQgY3kR
   wNd0vN2+DFXkrp+pbJN3jq8XIbT3ph1hr0eyZCGunwIHhioBJ7UHgMeoW
   w==;
X-CSE-ConnectionGUID: +uW48WWIR92BxcaT6OaGSg==
X-CSE-MsgGUID: pLKwpQozRS22xDWK70SGzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="33329784"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="33329784"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 08:53:08 -0700
X-CSE-ConnectionGUID: tcjiEK13RmWtiqkxiu2aew==
X-CSE-MsgGUID: VGYhRvXaRAeqcW9zowBLGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="85243352"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Oct 2024 08:53:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t408y-000Wck-10;
	Thu, 24 Oct 2024 15:53:00 +0000
Date: Thu, 24 Oct 2024 23:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	andrew@lunn.ch, Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	horatiu.vultur@microchip.com,
	jensemil.schulzostergaard@microchip.com,
	Parthiban.Veerasooran@microchip.com, Raju.Lakkaraju@microchip.com,
	UNGLinuxDriver@microchip.com,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, jacob.e.keller@intel.com,
	ast@fiberby.net, maxime.chevallier@bootlin.com
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 06/15] net: lan969x: add match data for lan969x
Message-ID: <202410242319.ShJiPqSp-lkp@intel.com>
References: <20241021-sparx5-lan969x-switch-driver-2-v1-6-c8c49ef21e0f@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021-sparx5-lan969x-switch-driver-2-v1-6-c8c49ef21e0f@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_085308_872711_49C466FA 
X-CRM114-Status: GOOD (  10.54  )
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

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on 30d9d8f6a2d7e44a9f91737dd409dbc87ac6f6b7]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Machon/net-sparx5-add-support-for-lan969x-SKU-s-and-core-clock/20241021-220557
base:   30d9d8f6a2d7e44a9f91737dd409dbc87ac6f6b7
patch link:    https://lore.kernel.org/r/20241021-sparx5-lan969x-switch-driver-2-v1-6-c8c49ef21e0f%40microchip.com
patch subject: [PATCH net-next 06/15] net: lan969x: add match data for lan969x
config: m68k-randconfig-r121-20241024 (https://download.01.org/0day-ci/archive/20241024/202410242319.ShJiPqSp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241024/202410242319.ShJiPqSp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242319.ShJiPqSp-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.o: in function `sparx5_vcap_init':
>> sparx5_vcap_impl.c:(.text+0x4632): undefined reference to `vcap_port_debugfs'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.o: in function `sparx5_vcap_destroy':
>> sparx5_vcap_impl.c:(.text+0x4d24): undefined reference to `vcap_del_rules'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.o: in function `sparx5_vcap_es2_get_port_ipv4_keysets':
>> sparx5_vcap_impl.c:(.text+0x38): undefined reference to `vcap_keyset_list_add'
>> m68k-linux-ld: sparx5_vcap_impl.c:(.text+0x50): undefined reference to `vcap_keyset_list_add'
   m68k-linux-ld: sparx5_vcap_impl.c:(.text+0x68): undefined reference to `vcap_keyset_list_add'
   m68k-linux-ld: sparx5_vcap_impl.c:(.text+0x80): undefined reference to `vcap_keyset_list_add'
   m68k-linux-ld: sparx5_vcap_impl.c:(.text+0x98): undefined reference to `vcap_keyset_list_add'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.o: in function `sparx5_vcap_ingress_add_default_fields':
>> sparx5_vcap_impl.c:(.text+0x114): undefined reference to `vcap_lookup_keyfield'
>> m68k-linux-ld: sparx5_vcap_impl.c:(.text+0x142): undefined reference to `vcap_rule_add_key_u32'
>> m68k-linux-ld: sparx5_vcap_impl.c:(.text+0x1a6): undefined reference to `vcap_rule_add_key_bit'
   m68k-linux-ld: sparx5_vcap_impl.c:(.text+0x1d2): undefined reference to `vcap_rule_add_key_bit'
   m68k-linux-ld: sparx5_vcap_impl.c:(.text+0x21e): undefined reference to `vcap_rule_add_key_bit'
>> m68k-linux-ld: sparx5_vcap_impl.c:(.text+0x268): undefined reference to `vcap_rule_add_key_u72'
>> m68k-linux-ld: sparx5_vcap_impl.c:(.text+0x288): undefined reference to `vcap_keyset_name'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.o: in function `sparx5_vcap_add_default_fields':
>> sparx5_vcap_impl.c:(.text+0x31e): undefined reference to `vcap_rule_add_key_u32'
>> m68k-linux-ld: sparx5_vcap_impl.c:(.text+0x358): undefined reference to `vcap_lookup_keyfield'
   m68k-linux-ld: sparx5_vcap_impl.c:(.text+0x368): undefined reference to `vcap_rule_add_key_u32'
   m68k-linux-ld: sparx5_vcap_impl.c:(.text+0x3b6): undefined reference to `vcap_rule_add_key_bit'
   m68k-linux-ld: sparx5_vcap_impl.c:(.text+0x3d4): undefined reference to `vcap_rule_add_key_bit'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.o: in function `sparx5_vcap_es0_get_port_keysets.isra.0':
   sparx5_vcap_impl.c:(.text+0x704): undefined reference to `vcap_keyset_list_add'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.o: in function `sparx5_vcap_es2_get_port_keysets.isra.0':
   sparx5_vcap_impl.c:(.text+0xadc): undefined reference to `vcap_keyset_list_add'
   m68k-linux-ld: sparx5_vcap_impl.c:(.text+0xb3c): undefined reference to `vcap_keyset_list_add'
   m68k-linux-ld: sparx5_vcap_impl.c:(.text+0xb98): undefined reference to `vcap_keyset_list_add'
   m68k-linux-ld: sparx5_vcap_impl.c:(.text+0xbc2): undefined reference to `vcap_keyset_list_add'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.o:sparx5_vcap_impl.c:(.text+0xc42): more undefined references to `vcap_keyset_list_add' follow
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.o: in function `sparx5_vcap_validate_keyset':
>> sparx5_vcap_impl.c:(.text+0x214e): undefined reference to `vcap_keyset_name'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.o: in function `sparx5_vcap_init':
>> sparx5_vcap_impl.c:(.text+0x464a): undefined reference to `vcap_debugfs'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_select_protocol_keyset':
>> sparx5_tc_flower.c:(.text+0x2b8): undefined reference to `vcap_keyfieldset'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_flower_replace':
>> sparx5_tc_flower.c:(.text+0x1c58): undefined reference to `vcap_rule_add_action_u32'
>> m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1ffc): undefined reference to `vcap_rule_add_action_u32'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_flower_handler_basic_usage':
>> sparx5_tc_flower.c:(.text+0x5a): undefined reference to `vcap_rule_add_key_u32'
>> m68k-linux-ld: sparx5_tc_flower.c:(.text+0xd2): undefined reference to `vcap_rule_add_key_u32'
>> m68k-linux-ld: sparx5_tc_flower.c:(.text+0x11e): undefined reference to `vcap_rule_add_key_bit'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x168): undefined reference to `vcap_rule_add_key_bit'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x190): undefined reference to `vcap_rule_add_key_bit'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1b4): undefined reference to `vcap_rule_add_key_bit'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_select_protocol_keyset':
>> sparx5_tc_flower.c:(.text+0x264): undefined reference to `vcap_rule_find_keysets'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x3ca): undefined reference to `vcap_set_rule_set_keyset'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x402): undefined reference to `vcap_rule_mod_key_u32'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_flower_handler_vlan_usage':
   sparx5_tc_flower.c:(.text+0x476): undefined reference to `vcap_tc_flower_handler_vlan_usage'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x4ec): undefined reference to `vcap_rule_add_key_u32'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x50e): undefined reference to `vcap_rule_add_key_u32'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_flower_handler_control_usage':
   sparx5_tc_flower.c:(.text+0x5a2): undefined reference to `vcap_rule_add_key_u32'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_flower_handler_cvlan_usage':
   sparx5_tc_flower.c:(.text+0x842): undefined reference to `vcap_tc_flower_handler_cvlan_usage'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_flower_destroy.isra.0':
   sparx5_tc_flower.c:(.text+0x8a6): undefined reference to `vcap_lookup_rule_by_cookie'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x8c0): undefined reference to `vcap_get_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x8da): undefined reference to `vcap_find_actionfield'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x94c): undefined reference to `vcap_free_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x95a): undefined reference to `vcap_del_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0xa4a): undefined reference to `vcap_del_rule'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_flower_simplify_rule.isra.0':
   sparx5_tc_flower.c:(.text+0xace): undefined reference to `vcap_rule_rem_key'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0xb0e): undefined reference to `vcap_rule_rem_key'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0xb2a): undefined reference to `vcap_rule_rem_key'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0xb68): undefined reference to `vcap_rule_rem_key'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_action_vlan_modify.isra.0':
   sparx5_tc_flower.c:(.text+0xbb8): undefined reference to `vcap_rule_add_action_u32'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_add_rule_link.isra.0':
   sparx5_tc_flower.c:(.text+0xce2): undefined reference to `vcap_find_admin'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0xcfa): undefined reference to `vcap_chain_offset'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0xd5a): undefined reference to `vcap_rule_add_action_u32'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0xd74): undefined reference to `vcap_rule_add_action_bit'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0xd92): undefined reference to `vcap_rule_add_action_u32'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0xdc8): undefined reference to `vcap_rule_add_action_u32'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_set_actionset.isra.0':
   sparx5_tc_flower.c:(.text+0xe4e): undefined reference to `vcap_set_rule_set_actionset'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_add_rule_counter.isra.0':
   sparx5_tc_flower.c:(.text+0xeba): undefined reference to `vcap_rule_mod_action_u32'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0xed2): undefined reference to `vcap_rule_set_counter_id'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0xef6): undefined reference to `vcap_rule_mod_action_u32'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_add_rule_copy':
   sparx5_tc_flower.c:(.text+0xf64): undefined reference to `vcap_copy_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0xf96): undefined reference to `vcap_filter_rule_keys'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0xfa2): undefined reference to `vcap_set_rule_set_keyset'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0xfc8): undefined reference to `vcap_rule_mod_key_u32'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0xfd4): undefined reference to `vcap_set_rule_set_actionset'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0xfe6): undefined reference to `vcap_free_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1016): undefined reference to `vcap_val_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1026): undefined reference to `vcap_add_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1054): undefined reference to `vcap_free_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x106a): undefined reference to `vcap_keyset_name'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1090): undefined reference to `vcap_free_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x10bc): undefined reference to `vcap_set_tc_exterr'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x10c8): undefined reference to `vcap_free_rule'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_flower_action_check.isra.0':
   sparx5_tc_flower.c:(.text+0x122c): undefined reference to `vcap_is_last_chain'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x12fc): undefined reference to `vcap_is_next_lookup'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_flower_template_create':
   sparx5_tc_flower.c:(.text+0x14f0): undefined reference to `vcap_admin_rule_count'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1570): undefined reference to `vcap_alloc_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x15cc): undefined reference to `vcap_rule_find_keysets'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x15e4): undefined reference to `vcap_select_min_rule_keyset'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1648): undefined reference to `vcap_free_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x169c): undefined reference to `vcap_free_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1736): undefined reference to `vcap_free_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1766): undefined reference to `vcap_free_rule'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_flower_replace':
   sparx5_tc_flower.c:(.text+0x183c): undefined reference to `vcap_alloc_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1890): undefined reference to `vcap_free_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x18da): undefined reference to `vcap_rule_add_key_u32'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x18ec): undefined reference to `vcap_free_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1990): undefined reference to `vcap_free_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x19a8): undefined reference to `vcap_rule_add_key_u32'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1ad8): undefined reference to `vcap_rule_add_action_bit'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1af4): undefined reference to `vcap_rule_add_action_u32'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1b56): undefined reference to `vcap_val_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1b68): undefined reference to `vcap_add_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1bb8): undefined reference to `vcap_free_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1bf2): undefined reference to `vcap_rule_add_action_u32'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1cbc): undefined reference to `vcap_rule_add_action_u32'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1cf6): undefined reference to `vcap_rule_add_action_u72'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1ee4): undefined reference to `vcap_free_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1f32): undefined reference to `vcap_free_rule'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1f94): undefined reference to `vcap_rule_add_key_u32'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1fcc): undefined reference to `vcap_rule_add_action_u32'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x1fea): undefined reference to `vcap_rule_add_action_bit'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x203c): undefined reference to `vcap_rule_add_action_bit'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x2054): undefined reference to `vcap_rule_add_action_u32'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x2092): undefined reference to `vcap_set_rule_set_keyset'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x2110): undefined reference to `vcap_set_tc_exterr'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x211a): undefined reference to `vcap_free_rule'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o: in function `sparx5_tc_flower':
   sparx5_tc_flower.c:(.text+0x224e): undefined reference to `vcap_find_admin'
   m68k-linux-ld: sparx5_tc_flower.c:(.text+0x2378): undefined reference to `vcap_get_rule_count_by_cookie'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o:(.rodata+0x986): undefined reference to `vcap_tc_flower_handler_ipv4_usage'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o:(.rodata+0x98a): undefined reference to `vcap_tc_flower_handler_ipv6_usage'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o:(.rodata+0x98e): undefined reference to `vcap_tc_flower_handler_portnum_usage'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o:(.rodata+0x99a): undefined reference to `vcap_tc_flower_handler_ethaddr_usage'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o:(.rodata+0x9a2): undefined reference to `vcap_tc_flower_handler_arp_usage'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o:(.rodata+0x9ce): undefined reference to `vcap_tc_flower_handler_tcp_usage'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.o:(.rodata+0x9d2): undefined reference to `vcap_tc_flower_handler_ip_usage'
   m68k-linux-ld: drivers/net/ethernet/microchip/sparx5/sparx5_tc_matchall.o: in function `sparx5_tc_matchall_replace':
   sparx5_tc_matchall.c:(.text+0x13e): undefined reference to `vcap_enable_lookups'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SPARX5_SWITCH
   Depends on [n]: NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MICROCHIP [=y] && NET_SWITCHDEV [=y] && HAS_IOMEM [=y] && OF [=n] && (ARCH_SPARX5 || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=y] && (BRIDGE [=y] || BRIDGE [=y]=n [=n])
   Selected by [y]:
   - LAN969X_SWITCH [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MICROCHIP [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

